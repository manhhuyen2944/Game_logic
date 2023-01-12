import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:project_threeh/Srceen/Frame_Home.dart';
import 'package:project_threeh/music.dart';

class frame_manhinhcho extends StatefulWidget {
  const frame_manhinhcho({super.key});

  @override
  State<frame_manhinhcho> createState() => _frame_manhinhchoState();
}

class _frame_manhinhchoState extends State<frame_manhinhcho> {
  @override
  Widget build(BuildContext context) {
    Music.init();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 30, left: 5),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: <Color>[
              Color.fromARGB(183, 83, 18, 7),
              Color.fromARGB(183, 22, 3, 4),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  CupertinoIcons.xmark,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Image.asset(
              'assets/tienganh.gif',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Chào Mừng bạn đến với game',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'QUIZ THREE-H',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 34,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Game giúp bạn giải trí giảm bớt căng thẳng trong cuộc sống hằng ngày',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 50, left: 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'BẮT ĐẦU',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Frame_Home(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
