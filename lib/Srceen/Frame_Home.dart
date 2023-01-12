import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_threeh/PlayGame/Frame_Battle.dart';
import 'package:project_threeh/PlayGame/Frame_History.dart';
import 'package:project_threeh/Accouts/Frame_Information.dart';
import 'package:project_threeh/PlayGame/Frame_BXH.dart';
import 'package:project_threeh/PlayGame/Frame_Wait.dart';

import 'package:project_threeh/PlayGame/optionsTopic.dart';
import 'package:project_threeh/Srceen/Frame_Setting.dart';
import 'package:project_threeh/Srceen/Frame_Shop.dart';

import 'dart:io';

import 'package:project_threeh/model/question.dart';

class Frame_Home extends StatefulWidget {
  const Frame_Home({super.key});

  @override
  State<Frame_Home> createState() => _Frame_HomeState();
}

class _Frame_HomeState extends State<Frame_Home> {
  final user = FirebaseAuth.instance.currentUser!;
  String? name;
  int exp = 0;
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        // .doc(user.uid)
        .where('email', isEqualTo: user.email)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              final r = document.data() as Map<String, dynamic>;
              // if (r['email'] == user.email) {
              try {
                setState(() {
                  name = r['username'];
                  exp = r['exp'];
                });
              } catch (e) {
                print(e.toString());
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    getDocId();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_6.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Image.asset(
                                  'assets/avatar1.png',
                                  width: size.width / 24,
                                  fit: BoxFit.cover,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Frame_Information(),
                                    ),
                                  );
                                },
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 2, bottom: 2),
                                child: Text(
                                  '$name',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 150, 223, 137),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Text(
                            'Lv',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 40,
                              width: MediaQuery.of(context).size.width / 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 40,
                              width: MediaQuery.of(context).size.width /
                                  6 *
                                  ((exp / 100) % 1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color.fromARGB(255, 150, 223, 137),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 40,
                              width: MediaQuery.of(context).size.width / 6,
                              child: Center(
                                child: Text(
                                  (exp ~/ 100).toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                //height: size.height / 30,
                                padding: EdgeInsets.only(left: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/diamond.png',
                                      width: size.width / 30,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        '100',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.add_circle,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Frame_Shop(),
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 5),
                  Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                    width: size.width / 8,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  CircleAvatar(
                    child: Image.asset(
                      'assets/vatly.gif',
                      fit: BoxFit.cover,
                      width: size.width / 3.5,
                    ),
                    radius: 70,
                    backgroundColor: Colors.redAccent.withOpacity(0.6),
                  ),
                  Text(
                    '$name',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 224, 162, 238)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(255, 61, 161, 243).withOpacity(0.8)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
                  onPressed: (() => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OptionTopic(),
                          ),
                        )
                      }),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                    child: Text(
                      'CHƠI',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.blueGrey.withOpacity(0.8)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
                  onPressed: (() => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Frame_Wait(),
                          ),
                        ),
                      }),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      'CHƠI ĐỐI KHÁNG',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.blueGrey.withOpacity(0.8)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
                  onPressed: (() => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Frame_BXH(),
                          ),
                        )
                      }),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      'BẢNG XẾP HẠNG',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.blueGrey.withOpacity(0.8)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
                  onPressed: (() => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Frame_History(
                              score: 0,
                            ),
                          ),
                        )
                      }),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                    child: Text(
                      'LỊCH SỬ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.blueGrey.withOpacity(0.8)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Bạn có muốn thoát game không?'),
                            actions: <Widget>[
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Không')),
                              ElevatedButton(
                                  onPressed: () {
                                    if (Platform.isAndroid) {
                                      SystemNavigator.pop();
                                    } else {
                                      exit(0);
                                    }
                                  },
                                  child: Text('Có')),
                            ],
                          );
                        });
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      'THOÁT',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.settings_applications_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: (() => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Frame_Setting(),
                                ),
                              ),
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
