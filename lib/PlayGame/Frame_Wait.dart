// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_threeh/PlayGame/Frame_Battle.dart';
import 'package:project_threeh/Srceen/Frame_Home.dart';

import 'package:project_threeh/model/question.dart';
import '../component/action_button.dart';

class Frame_Wait extends StatefulWidget {
  const Frame_Wait({Key? key}) : super(key: key);

  @override
  State<Frame_Wait> createState() => _Frame_WaitState();
}

class _Frame_WaitState extends State<Frame_Wait> {
  final auth = FirebaseAuth.instance.currentUser!;
  final firestore = FirebaseFirestore.instance;

  int time = 0;
  bool ishas = false;

  late Timer timer;
  void runTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (mounted) {
        setState(() {
          time++;
        });
        await getMatch();
      }

      if (ishas) {
        Navigator.pop(context);
        LengthQuestion().then((value) async {
          await firestore
              .collection('questions')
              .where('id',
                  isGreaterThanOrEqualTo: (Random().nextDouble() * l).floor())
              .limit(90)
              .get()
              .then((v) {
            final questionDocs = v.docs;

            lsQuestions = questionDocs
                .map((e) => Question.fromQueryDocumentSnapshot(e))
                .toList();
          }).then((m) {
            int totaltime = 0;
            FirebaseFirestore.instance
                .collection('config')
                .doc('totalbattel')
                .get()
                .then((value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Frame_Battle(
                            totalTime: value.get('key'),
                            questions: lsQuestions,
                            counter: count))),
                    (route) => false));
          });
        });
        timer.cancel();
      }
    });
  }

  String uid1 = '';
  String uid2 = '';
  String name1 = '';
  String name2 = '';
  int roomid = -1;

  List<Question> lsQuestions = [];

  int count = 0;

  Future getName() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.uid)
        .get()
        .then((value) {
      uid1 = auth.uid;
      name1 = value.get('username');
    });
  }

  Future getMatch() async {
    await FirebaseFirestore.instance
        .collection('matches')
        .doc(roomid.toString())
        .get()
        .then((value) {
      uid1 = auth.uid;
      if (uid1 == value.get('user1')[0]) {
        uid2 = value.get('user2')[0];
        name1 = value.get('user1')[1];
        name2 = value.get('user2')[1];
      } else if (uid1 == value.get('user2')[0]) {
        uid2 = value.get('user1')[0];
        name1 = value.get('user2')[1];
        name2 = value.get('user1')[1];
      }
    });
    if (uid2 != '') {
      setState(() {
        ishas = true;
        timer.cancel();
      });
    }
  }

  int l = 0;
  Future LengthQuestion() async {
    final authUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection('questions')
        .get()
        .then((value) => setState(() {
              l = value.docs.length;
            }));
  }

  @override
  void initState() {
    super.initState();
    getName().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Frame_Home(),
                ));
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_11.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
              width: size.width / 4,
            ),
            const Text(
              '1 VS 1',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: size.height / 3,
                // decoration:
                //     BoxDecoration(color: Colors.white.withOpacity(0.9)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width / 3,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(color: Colors.blue),
                                  child: Image.asset(
                                    'assets/avatar1.png',
                                    fit: BoxFit.cover,
                                    height: (size.height / 3) / 2,
                                  ),
                                ),
                                Text(
                                  name1,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red),
                                )
                              ]),
                        ),
                        Container(
                          width: size.width / 3,
                          child: ishas
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                      Container(
                                        decoration:
                                            BoxDecoration(color: Colors.red),
                                        child: Image.asset(
                                          'assets/avatar1.png',
                                          fit: BoxFit.cover,
                                          height: (size.height / 3) / 2,
                                        ),
                                      ),
                                      Text(name2,
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.red))
                                    ])
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration:
                                          BoxDecoration(color: Colors.red),
                                      child: Container(
                                        height: (size.height / 3) / 2,
                                      ),
                                    ),
                                    Text('', style: TextStyle(fontSize: 20))
                                  ],
                                ),
                        ),
                      ],
                    ),
                    Image.asset('assets/vs.png')
                  ],
                )),
            ishas
                ? Column(
                    children: [
                      Image.asset('assets/timer.gif', width: size.width / 2),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      ActionButton(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                            opaque: false, // set to false
                            pageBuilder: (_, __, ___) =>
                                FutureBuilder<DocumentSnapshot>(
                              future: firestore
                                  .collection('counters')
                                  .doc('wait')
                                  .get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return AlertDialog(
                                    actions: <Widget>[
                                      Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    ],
                                  );
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  roomid = snapshot.data!.get('counter');
                                  firestore
                                      .collection('counters')
                                      .doc('wait')
                                      .set({'counter': roomid + 1});

                                  if (roomid % 2 == 0) {
                                    firestore
                                        .collection('matches')
                                        .doc((roomid).toString())
                                        .set({
                                      'user1': [
                                        auth.uid,
                                        name1,
                                        0,
                                      ],
                                      'user2': [
                                        '',
                                        '',
                                        0,
                                      ],
                                    });
                                  } else {
                                    roomid -= 1;

                                    firestore
                                        .collection('matches')
                                        .doc((roomid).toString())
                                        .update({
                                      'user2': [
                                        auth.uid,
                                        name1,
                                        0,
                                      ],
                                    });
                                  }

                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                        width: size.width - 50,
                                        height: size.height / 3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.black.withOpacity(0.8),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/loadding.gif',
                                              fit: BoxFit.cover,
                                              width: size.width / 5,
                                            ),
                                            Container(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                'Đang tìm đối thủ không xứng tầm.......',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  timer.cancel();
                                                  if (uid2 == '') {
                                                    await firestore
                                                        .collection('counters')
                                                        .doc('wait')
                                                        .get()
                                                        .then((value) => count =
                                                            value.get(
                                                                'counter'));
                                                    await firestore
                                                        .collection('matches')
                                                        .doc((count - 1)
                                                            .toString())
                                                        .delete();

                                                    await firestore
                                                        .collection('counters')
                                                        .doc('wait')
                                                        .update({
                                                      'counter': count - 1
                                                    });
                                                  }
                                                  Navigator.pop(context);
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.red)),
                                                child: Text(
                                                  'Hủy',
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                return AlertDialog(
                                  actions: <Widget>[
                                    Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  ],
                                );
                              },
                            ),
                          ));

                          runTime();
                        },
                        title: 'Bắt đầu',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
