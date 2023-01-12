import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:project_threeh/Accouts/Frame_ForgotP.dart';

import 'package:project_threeh/main.dart';

class FrameLogin extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const FrameLogin({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<FrameLogin> createState() => _FrameLoginState();
}

class _FrameLoginState extends State<FrameLogin> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_5.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(20.0)),
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width / 3,
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 20,
                      )
                    ],
                    border: Border.all(
                      width: 2.0,
                    ),
                    color: Colors.black.withOpacity(0.8)),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: email,
                        cursorColor: Colors.orange,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.black)),
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.orange,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: password,
                        cursorColor: Colors.orange,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.black)),
                          border: OutlineInputBorder(),
                          hintText: 'Mật khẩu',
                          hintStyle: TextStyle(
                            color: Colors.orange,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: login,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            'ĐĂNG NHẬP',
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
                      child: GestureDetector(
                        child: Text(
                          'Quên Mật Khẩu',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Frame_ForgotP(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 20),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            text: 'Chưa có tài khoản?  ',
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedSignUp,
                                text: 'Đăng Ký',
                                style: TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.underline,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            ]),
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

  Future login() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      // var name = FirebaseFirestore.instance.collection('users').where()
      // final snackBar = SnackBar(content: Text('Đăng nhập thành công'));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      final snackBar = SnackBar(content: Text('Đăng nhập thành công'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      print(e);
      final snackBar =
          SnackBar(content: Text('nhập email hoặc mật khẩu không đúng'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
