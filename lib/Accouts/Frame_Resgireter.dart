import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:project_threeh/Accouts/Frame_Login.dart';
import 'package:project_threeh/main.dart';

class Frame_Register extends StatefulWidget {
  final Function() onClickedSignIn;
  // final String text;
  // final VoidCallback onClicked;
  const Frame_Register({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  _Frame_RegisterState createState() => _Frame_RegisterState();
}

class _Frame_RegisterState extends State<Frame_Register> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final displayName = TextEditingController();

  //final user = FirebaseAuth.instance.currentUser!;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    repeatPasswordController.dispose();
    displayName.dispose();
    super.dispose();
  }

  @override
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width / 3,
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 2, left: 20, right: 20, bottom: 2),
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
                        child: TextFormField(
                            controller: displayName,
                            cursorColor: Colors.orange,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.black)),
                              border: OutlineInputBorder(),
                              hintText: 'Tên người chơi',
                              hintStyle: TextStyle(
                                color: Colors.orange,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 3
                                    ? 'Tên người chơi phải trên 3 ký tự '
                                    : null),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: email,
                          cursorColor: Colors.orange,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0, color: Colors.black)),
                            border: OutlineInputBorder(),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.orange,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Email không hợp lệ'
                                  : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: password,
                            cursorColor: Colors.orange,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.black)),
                              border: OutlineInputBorder(),
                              hintText: 'Mật khẩu',
                              hintStyle: TextStyle(
                                color: Colors.orange,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            obscureText: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) => value != null &&
                                    value.length < 6
                                ? 'Mật khẩu phải trên 6 ký tự và dưới 30 ký tự'
                                : null),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: repeatPasswordController,
                          cursorColor: Colors.orange,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0, color: Colors.black)),
                            border: OutlineInputBorder(),
                            hintText: 'Nhập lại mật khẩu mới',
                            hintStyle: TextStyle(
                              color: Colors.orange,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return password.text == value
                                ? null
                                : "Vui lòng nhập đúng mật khẩu mới";
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.orange.withOpacity(0.8)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)))),
                          onPressed: signUp,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text(
                              'ĐĂNG KÝ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
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
                              text: 'Đã có tài khoản?  ',
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = widget.onClickedSignIn,
                                  text: 'Đăng Nhập',
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
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      addUserDetails(
        displayName.text.trim(),
        email.text.trim(),
      );

      final snackBar = SnackBar(content: Text('Đăng ký thành công'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      print(e);
      final snackBar = SnackBar(content: Text('Email đã tồn tại'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future addUserDetails(String displayname, String email) async {
    final user = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'username': displayname,
      'email': email,
      'photoUrl': null,
      'score': 0,
      'exp': 100,
      'date': Timestamp.now(),
    });
  }
}
