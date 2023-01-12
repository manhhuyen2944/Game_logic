import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Frame_Information extends StatefulWidget {
  @override
  _Frame_InformationState createState() => _Frame_InformationState();
}

class _Frame_InformationState extends State<Frame_Information> {
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;
  final password = TextEditingController();
  final displayName = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;
  var newPassword = "";
  final newPassswordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? name;
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        // .doc(user.uid)
        .where('email', isEqualTo: user.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            final r = document.data() as Map<String, dynamic>;
            // if (r['email'] == user.email) {
            try {
              setState(() {
                name = r['username'];
              });
            } catch (e) {
              print(e.toString());
            }
          }),
        );
  }

  @override
  void dispose() {
    displayName.dispose();
    password.dispose();
    newPassswordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  changePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      //FirebaseAuth.instance.signOut();
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Frame_Information(),),);
      final snackBar = SnackBar(content: Text('Đổi mật khẩu thành công'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      final snackBar = SnackBar(
          content: Text(
        'Mật khẩu không đúng',
      ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    getDocId();
    Size size = MediaQuery.of(context).size;

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
            image: AssetImage('assets/img_11.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      'Thông tin cá nhân',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      child: Image.asset(
                        'assets/sinhhoc.gif',
                        fit: BoxFit.cover,
                        width: size.width / 3.5,
                      ),
                      radius: 100,
                      backgroundColor: Colors.blue.withOpacity(0.7),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width / 1.25,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.blueGrey),
                          ),
                          border: OutlineInputBorder(),
                          hintText: name,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        readOnly: true,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),

                    Container(
                      width: size.width / 1.25,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.blueGrey),
                          ),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          hintText: user.email,
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        readOnly: true,
                      ),
                    ),

                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    // Container(
                    //   width: size.width / 1.25,
                    //   child: TextFormField(
                    //     style: TextStyle(color: Colors.white),

                    //     decoration: InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide:
                    //             BorderSide(width: 1.0, color: Colors.blueGrey),
                    //       ),
                    //       border: OutlineInputBorder(),
                    //       prefixIcon: Icon(
                    //         Icons.key_sharp,
                    //         color: Colors.white,
                    //         size: 30,
                    //       ),
                    //       hintText: 'Nhập mật khẩu hiện tại ',
                    //       hintStyle: TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    // controller: password,

                    //   ),
                    // ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: size.width / 1.25,
                      child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0, color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.key_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                            hintText: 'Đổi mật khẩu ',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          obscureText: true,
                          controller: newPassswordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value != null &&
                                  value.length < 6
                              ? 'Mật khẩu phải trên 6 ký tự và dưới 30 ký tự'
                              : null),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width / 1.25,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.blueGrey),
                          ),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.key_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          hintText: 'Xác nhận mật khẩu',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        obscureText: true,
                        controller: repeatPasswordController,
                        validator: (value) {
                          return newPassswordController.text == value
                              ? null
                              : "Vui lòng xác thực lại mật khẩu mới";
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.redAccent.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              newPassword = newPassswordController.text;
                            });
                            changePassword();
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text(
                            'CẬP NHẬT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
