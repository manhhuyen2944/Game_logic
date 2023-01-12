import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

//import 'package:project_threeh/Srceen/Frame_Home.dart';

class Frame_BXH extends StatefulWidget {
  const Frame_BXH({Key? key}) : super(key: key);

  @override
  State<Frame_BXH> createState() => _Frame_BXHState();
}

class _Frame_BXHState extends State<Frame_BXH> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => Frame_Home(),
        //         ));
        //   },
        // ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Bảng xếp hạng',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.blueAccent),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .orderBy('score', descending: true)
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
