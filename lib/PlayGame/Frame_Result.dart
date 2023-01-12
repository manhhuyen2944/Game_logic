import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_threeh/PlayGame/Frame_Wait.dart';
import 'package:project_threeh/Srceen/Frame_Home.dart';

class Frame_Result extends StatefulWidget {
  const Frame_Result({Key? key, required this.result}) : super(key: key);

  final int result;
  @override
  State<Frame_Result> createState() => _Frame_WinState();
}

class _Frame_WinState extends State<Frame_Result> {
  @override
  Widget build(BuildContext context) {
    getMatch();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_8.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: EdgeInsets.only(bottom: 5, top: 5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    color: Colors.white.withOpacity(0.3)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Kết quả',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.pink.withOpacity(0.7)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: result1 > result2
                          ? Image.asset(
                              'assets/win.gif',
                              width: MediaQuery.of(context).size.width / 2,
                              fit: BoxFit.cover,
                            )
                          : result1 < result2
                              ? Image.asset(
                                  'assets/lose.gif',
                                  width: MediaQuery.of(context).size.width / 2,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/tie.gif',
                                  width: MediaQuery.of(context).size.width / 2,
                                  fit: BoxFit.cover,
                                ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$result1 - $result2',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.red),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                                      builder: (context) => Frame_Home(),
                                    ),
                                  ),
                                }),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Text(
                                'Thoát',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.green),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)))),
                            onPressed: (() => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Frame_Wait(),
                                    ),
                                  ),
                                }),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Text(
                                'Chơi tiếp',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final auth = FirebaseAuth.instance.currentUser!;
  final firestore = FirebaseFirestore.instance;

  int rank = 0;

  Future getUser() async {
    await firestore.collection('users').doc(auth.uid).get().then((value) {
      setState(() {
        // rank = value.get('rank');
      });
    });
  }

  Future update() async {
    int match = 0;

    await firestore.collection('counters').doc('wait').get().then((value) {
      match = value.get('counter') - 2;
    });
    final doc = firestore.collection('matches').doc(match.toString());
    doc.get().then((value) {
      if (auth.uid == value.get('user1')[0]) {
        var ls = value.get('user1');
        ls[2] = widget.result;
        doc.update({'user1': ls});
      } else {
        var ls = value.get('user2');
        ls[2] = widget.result;
        doc.update({'user2': ls});
      }
    });
  }

  String uid1 = '';
  String uid2 = '';
  int result1 = 0;
  int result2 = 0;
  bool? isUp;

  Future getMatch() async {
    int match = 0;

    await firestore.collection('counters').doc('wait').get().then((value) {
      if (value.get('counter') % 2 == 0) {
        match = value.get('counter') - 2;
        firestore
            .collection('matches')
            .doc(match.toString())
            .get()
            .then((value) {
          uid1 = auth.uid;
          if (uid1 == value.get('user1')[0]) {
            if (mounted) {
              setState(() {
                uid2 = value.get('user2')[0];
                result1 = value.get('user1')[2];
                result2 = value.get('user2')[2];
              });
            }
          } else if (uid1 == value.get('user2')[0]) {
            if (mounted) {
              setState(() {
                uid2 = value.get('user1')[0];
                result1 = value.get('user2')[2];
                result2 = value.get('user1')[2];
              });
            }
          }
        });
      }
    });

    // result1 > result2
    //     ? isUp = (rank == 30 ? null : true)
    //     : result1 < result2
    //         ? isUp = (rank == 0 ? null : false)
    //         : isUp = null;
    // await firestore.collection('users').doc(auth.uid).update({
    //   'rank': isUp == true
    //       ? rank++
    //       : isUp == false
    //           ? rank--
    //           : rank
    // });
  }

  @override
  void initState() {
    super.initState();
    getUser().then((value) => setState(() {}));
    update().then((value) => setState(() {}));
  }
}
