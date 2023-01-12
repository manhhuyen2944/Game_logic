import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//  import 'package:flutter/src/widgets/container.dart';
//  import 'package:flutter/src/widgets/framework.dart';
import 'package:project_threeh/PlayGame/Frame_Question.dart';
import '../model/question.dart';
import '../component/action_button.dart';

class frame_level extends StatefulWidget {
  const frame_level({Key? key, required this.topic}) : super(key: key);
  final int topic;
  @override
  State<frame_level> createState() => _frame_levelState();
}

class _frame_levelState extends State<frame_level> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_6.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('questions')
                  .where('topicid', isEqualTo: widget.topic)
                  .where('levelid', isEqualTo: 1)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final questionDocs = snapshot.data!.docs;
                final questions = questionDocs
                    .map((e) => Question.fromQueryDocumentSnapshot(e))
                    .toList();
                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('config')
                      .snapshots(),
                  builder: ((context, snapshot) {
                    print(snapshot.error);
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final configDoc = snapshot.data!.docs.first.data()
                        as Map<String, dynamic>;
                    final totalTime = configDoc['key'];
                    return Column(
                      children: [
                        ActionButton(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Frame_Question(
                                  totalTime: totalTime,
                                  questions: questions,
                                ),
                              ),
                            );
                          },
                          title: 'Dễ',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tổng câu hỏi: ${questions.length}',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    );
                  }),
                );
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('questions')
                  .where('topicid', isEqualTo: widget.topic)
                  .where('levelid', isEqualTo: 2)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final questionDocs = snapshot.data!.docs;
                final questions = questionDocs
                    .map((e) => Question.fromQueryDocumentSnapshot(e))
                    .toList();
                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('config')
                      .snapshots(),
                  builder: ((context, snapshot) {
                    print(snapshot.error);
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final configDoc = snapshot.data!.docs.first.data()
                        as Map<String, dynamic>;
                    final totalTime = configDoc['key'];
                    return Column(
                      //mainAxisSize: MainAxisSize.min,
                      //mainAxisAlignment: MainAxisAlignment.min,
                      children: [
                        ActionButton(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Frame_Question(
                                  totalTime: totalTime,
                                  questions: questions,
                                ),
                              ),
                            );
                          },
                          title: 'Trung Bình',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tổng câu hỏi: ${questions.length}',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    );
                  }),
                );
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('questions')
                  .where('topicid', isEqualTo: widget.topic)
                  .where('levelid', isEqualTo: 3)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final questionDocs = snapshot.data!.docs;
                final questions = questionDocs
                    .map((e) => Question.fromQueryDocumentSnapshot(e))
                    .toList();
                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('config')
                      .snapshots(),
                  builder: ((context, snapshot) {
                    print(snapshot.error);
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final configDoc = snapshot.data!.docs.first.data()
                        as Map<String, dynamic>;
                    final totalTime = configDoc['key'];
                    return Column(
                      //mainAxisSize: MainAxisSize.min,
                      //mainAxisAlignment: MainAxisAlignment.min,
                      children: [
                        ActionButton(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Frame_Question(
                                  totalTime: totalTime,
                                  questions: questions,
                                ),
                              ),
                            );
                          },
                          title: 'Khó',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tổng câu hỏi: ${questions.length}',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
