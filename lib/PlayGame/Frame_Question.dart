import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_threeh/PlayGame/frame_end.dart';

import 'dart:async';

import 'package:project_threeh/model/question.dart';

class Frame_Question extends StatefulWidget {
  const Frame_Question({
    Key? key,
    required this.totalTime,
    required this.questions,
  }) : super(key: key);
  final int totalTime;
  final List<Question> questions;
  @override
  _Frame_QuestionState createState() => _Frame_QuestionState();
}

//int Diem = 0;

class _Frame_QuestionState extends State<Frame_Question> {
  late int _currentTime;
  late Timer _timer;
  int _currentIndex = 0;
  String _selectedAnswer = '';
  int _score = 0;
  bool isHelp = true;
  bool isCall = true;

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

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

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
            // SizedBox(
            //   height: 15,
            // ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              //height: MediaQuery.of(context).size.width,
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
            // Text(
            //   currentQuestion.question,
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 24,
            //   ),
            // ),
            //Spacer(),
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
                        if (_currentIndex == widget.questions.length - 1) {
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(padding: const EdgeInsets.all(5)),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.redAccent.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)))),
                        onPressed: () {
                          _timer.cancel();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title:
                                      Text('Bạn có muốn tiếp tục chơi không?'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          runtimer();
                                          Navigator.pop(context);
                                        },
                                        child: Text('Có'))
                                  ],
                                );
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                          child: Icon(Icons.pause_circle_outline_outlined),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(5)),
                      isCall
                          ? ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Colors.redAccent.withOpacity(0.8)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)))),
                              onPressed: (() => {
                                    isCall = false,
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                                'Quyền trợ giúp gọi điện cho người thân'),
                                            content: Text(currentQuestion
                                                .correctAnswer
                                                .toString()),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('OK'))
                                            ],
                                          );
                                        })
                                  }),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                child: Icon(Icons.family_restroom_outlined),
                              ),
                            )
                          : Text(''),
                      Padding(padding: const EdgeInsets.all(5)),
                      isHelp
                          ? ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Colors.redAccent.withOpacity(0.8)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)))),
                              onPressed: () async {
                                final ls = [];
                                currentQuestion.answers.forEach(
                                  (element) {
                                    if (element !=
                                            currentQuestion.correctAnswer &&
                                        ls.length < 2) {
                                      ls.add(element);
                                    }
                                  },
                                );
                                isHelp = false;
                                _timer.cancel();
                                return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Quyền trợ giúp 50:50'),
                                        content: SizedBox(
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text('Loại đáp án: ' + ls[0]),
                                              Text('Loại đáp án: ' + ls[1]),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                runtimer();
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'))
                                        ],
                                      );
                                    });
                              },
                              child: const Padding(
                                  padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                  child: Text(
                                    '50:50',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )),
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void pushResultScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => frame_end(
            score: _score,
            questions: widget.questions,
            totalTime: widget.totalTime),
      ),
    );
  }
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
