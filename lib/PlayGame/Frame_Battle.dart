import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_threeh/PlayGame/Frame_Result.dart';

import 'dart:async';

import 'package:project_threeh/model/question.dart';

class Frame_Battle extends StatefulWidget {
  const Frame_Battle({
    Key? key,
    required this.totalTime,
    required this.questions,
    required this.counter,
  }) : super(key: key);
  final int totalTime;
  final List<Question> questions;
  final int counter;
  @override
  _Frame_BattleState createState() => _Frame_BattleState();
}

class _Frame_BattleState extends State<Frame_Battle> {
  late int _currentTime;
  late Timer _timer;
  int _currentIndex = 0;
  String _selectedAnswer = '';
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _currentTime = widget.totalTime;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print(_currentTime);
      if (mounted)
        setState(() {
          _currentTime -= 1;
        });
      if (_currentTime == 0) {
        _timer.cancel();

        pushResultScreen(context);
      }
    });
  }

  @override
  void runtimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print(_currentTime);
      if (mounted)
        setState(() {
          _currentTime -= 1;
        });
      if (_currentTime == 0) {
        _timer.cancel();

        pushResultScreen(context);
      }
    });
  }

  // @override
  // void dispose() {
  //   _timer.cancel();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    final currentQuestion = widget.questions[_currentIndex];

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_10.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 85,
            ),
            SizedBox(
              height: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    LinearProgressIndicator(
                      value: _currentTime / widget.totalTime,
                      color: _timer.tick >= _currentTime * 3.5
                          ? Colors.redAccent
                          : _timer.tick >= _currentTime * 1
                              ? Colors.yellow
                              : Colors.green,
                    ),
                    Center(
                      child: Text(
                        _currentTime.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              'Câu hỏi:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                fontSize: 25,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                  ),
                  color: Colors.black.withOpacity(0.3)),
              child: Text(
                currentQuestion.question,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final answer = currentQuestion.answers[index];
                  return AnswerTile(
                    isSelected: answer == _selectedAnswer,
                    answer: answer,
                    correctAnswer: currentQuestion.correctAnswer,
                    onTap: () {
                      setState(() {
                        _selectedAnswer = answer;
                      });
                      if (answer == currentQuestion.correctAnswer) {
                        _score += 10;
                      }
                      Future.delayed(Duration(milliseconds: 200), (() {
                        if (_currentIndex == widget.questions.length - 1 ||
                            _currentTime == 0) {
                          pushResultScreen(context);
                          return;
                        }
                        setState(() {
                          _currentIndex++;
                          _selectedAnswer = '';
                        });
                      }));
                    },
                  );
                },
                itemCount: currentQuestion.answers.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pushResultScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Frame_Result(
          result: _score,
        ),
      ),
    );
  }

  int result1 = 0;
  int result2 = 0;

  // Future updateResult() async {
  //   final auth = FirebaseAuth.instance.currentUser!;
  //   final firestore = FirebaseFirestore.instance;
  //   final String uid1 = auth.uid;

  //   final match = FirebaseFirestore.instance
  //       .collection('matches')
  //       .doc(widget.counter.toString());

  //   final get = await match.get().then(
  //     (value) {
  //       if (uid1 == value.get('user1')[0]) {
  //         print(value.get('user1')[0]);
  //         match.update({
  //           'user1'[2]: _score,
  //         });
  //         setState(() {
  //           result1 = value.get('user1')[2];
  //           result2 = value.get('user2')[2];
  //         });
  //       } else if (uid1 == value.get('user2')[0]) {
  //         match.update({
  //           'user2'[2]: _score,
  //         });
  //         setState(() {
  //           result2 = value.get('user1')[2];
  //           result1 = value.get('user2')[2];
  //         });
  //       }
  //     },
  //   );
  // }
}

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    Key? key,
    required this.isSelected,
    required this.answer,
    required this.correctAnswer,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String answer;
  final String correctAnswer;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: ListTile(
        onTap: () => onTap(),
        title: Text(
          answer,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Color get cardColor {
    if (!isSelected) return Colors.white;

    if (answer == correctAnswer) {
      return Colors.green;
    }

    return Colors.redAccent;
  }
}
