import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Frame_History extends StatefulWidget {
  const Frame_History({Key? key, required this.score}) : super(key: key);
  final int score;
  @override
  State<Frame_History> createState() => _Frame_HistoryState();
}

class _Frame_HistoryState extends State<Frame_History> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Lịch sử chơi',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.blueAccent),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('historys')
                    // .orderBy('score', descending: true)
                    .where('email', isEqualTo: user.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  final users = snapshot.data!.docs;

                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          title: Text(
                            users[index]['username'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          trailing: Text(users[index]['score'].toString()),
                          subtitle: Text(
                            DateFormat('kk:mm:ss dd-MM-yyyy  a').format(
                              DateTime.parse(
                                users[index]['date'].toDate().toString(),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: users.length,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.red),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)))),
                onPressed: (() => {
                      Navigator.of(context).pop(),
                    }),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                  child: Text(
                    'Quay lại',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
