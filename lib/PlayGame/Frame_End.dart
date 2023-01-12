import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_threeh/PlayGame/optionsTopic.dart';
import 'package:project_threeh/model/history.dart';
import 'package:project_threeh/model/question.dart';
import 'package:project_threeh/PlayGame/Frame_Question.dart';
import 'package:flutter/material.dart';

class frame_end extends StatefulWidget {
  const frame_end({
    Key? key,
    required this.score,
    required this.questions,
    required this.totalTime,
  });
  final int score;
  final List<Question> questions;
  final int totalTime;
  @override
  State<frame_end> createState() => _frame_endState();
}

class _frame_endState extends State<frame_end> {
  @override
  Widget build(BuildContext context) {
    //_updateHighscore();
    Size size = MediaQuery.of(context).size;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Text(
                'Kết Thúc',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color.fromARGB(255, 18, 212, 238).withOpacity(0.8)),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    color: Colors.black.withOpacity(0.3)),
                child: Column(
                  children: [
                    Text(
                      'Xin chúc mừng bạn đã đạt được: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.score} ĐIỂM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.green),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: (() => {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Frame_Question(
                                    totalTime: widget.totalTime,
                                    questions: widget.questions),
                              ))
                            }),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                          child: Text(
                            'Tiếp tục',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.red),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: (() => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OptionTopic(),
                                  ))
                            }),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                          child: Text(
                            'Quay lại',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(8.0),
              //       child: Row(
              //         children: [
              //           Padding(padding: const EdgeInsets.all(5)),
              //           ElevatedButton(
              //             style: ButtonStyle(
              //                 backgroundColor: MaterialStatePropertyAll<Color>(
              //                     Colors.redAccent.withOpacity(0.8)),
              //                 shape: MaterialStateProperty.all(
              //                     RoundedRectangleBorder(
              //                         borderRadius:
              //                             BorderRadius.circular(10.0)))),
              //             onPressed: (() => {}),
              //             child: const Padding(
              //               padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
              //               child: Icon(Icons.pause_circle_outline_outlined),
              //             ),
              //           ),
              //           Padding(padding: const EdgeInsets.all(5)),
              //           ElevatedButton(
              //             style: ButtonStyle(
              //                 backgroundColor: MaterialStatePropertyAll<Color>(
              //                     Colors.redAccent.withOpacity(0.8)),
              //                 shape: MaterialStateProperty.all(
              //                     RoundedRectangleBorder(
              //                         borderRadius:
              //                             BorderRadius.circular(10.0)))),
              //             onPressed: (() => {}),
              //             child: const Padding(
              //                 padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
              //                 child: Icon(Icons.mobile_friendly_outlined)),
              //           ),
              //           Padding(padding: const EdgeInsets.all(5)),
              //           ElevatedButton(
              //             style: ButtonStyle(
              //                 backgroundColor: MaterialStatePropertyAll<Color>(
              //                     Colors.redAccent.withOpacity(0.8)),
              //                 shape: MaterialStateProperty.all(
              //                     RoundedRectangleBorder(
              //                         borderRadius:
              //                             BorderRadius.circular(10.0)))),
              //             onPressed: (() => {}),
              //             child: const Padding(
              //               padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
              //               child: Text(
              //                 '50:50',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 16,
              //                     color: Colors.white),
              //               ),
              //             ),
              //           ),
              //           Padding(padding: const EdgeInsets.all(5)),
              //           ElevatedButton(
              //             style: ButtonStyle(
              //                 backgroundColor: MaterialStatePropertyAll<Color>(
              //                     Colors.redAccent.withOpacity(0.8)),
              //                 shape: MaterialStateProperty.all(
              //                     RoundedRectangleBorder(
              //                         borderRadius:
              //                             BorderRadius.circular(10.0)))),
              //             onPressed: (() => {}),
              //             child: const Padding(
              //                 padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
              //                 child: Icon(Icons.call_end_sharp)),
              //           ),
              //           Padding(padding: const EdgeInsets.all(5)),
              //           ElevatedButton(
              //             style: ButtonStyle(
              //                 backgroundColor: MaterialStatePropertyAll<Color>(
              //                     Colors.blue.withOpacity(0.8)),
              //                 shape: MaterialStateProperty.all(
              //                     RoundedRectangleBorder(
              //                         borderRadius:
              //                             BorderRadius.circular(10.0)))),
              //             onPressed: (() => {}),
              //             child: const Padding(
              //               padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
              //               child: Icon(Icons.diamond_outlined),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _updateHighscore();
    _History();
  }

  Future _updateHighscore() async {
    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null) return;

    final userRef =
        FirebaseFirestore.instance.collection('users').doc(authUser.uid);
    // userRef.update('socre':w)
    final userDoc = await userRef.get();
    if (userDoc.exists) {
      final user = userDoc.data();
      if (user == null) return;

      final lasHighscore = user['score'];
      var result = widget.score;
      result = lasHighscore >= widget.score ? lasHighscore : widget.score;

      // if (lasHighscore >= widget.score) {
      //   return;
      // }

      // userRef.update({'score': widget.score, 'date': Timestamp.now()});
      userRef.update({
        'score': result,
        'date': Timestamp.now(),
        'exp': user['exp'] +
            (widget.score >= widget.questions.length / 2 * 10 ? 10 : 5),
      });

      return;
    }
  }

  Future<void> _History() async {
    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null) return;

    final userRef =
        FirebaseFirestore.instance.collection('users').doc(authUser.uid);
    final userDoc = await userRef.get();

    final user = userDoc.data();
    var username = user!['username'];
    FirebaseFirestore.instance.collection('historys').add({
      'date': Timestamp.now(),
      'username': username,
      'email': authUser.email,
      'score': widget.score,
    });

    return;
  }
}
