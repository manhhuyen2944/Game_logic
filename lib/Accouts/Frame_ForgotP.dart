import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:project_threeh/Accouts/Frame_Login.dart';
import 'package:email_validator/email_validator.dart';

class Frame_ForgotP extends StatefulWidget {
  @override
  _Frame_ForgotPState createState() => _Frame_ForgotPState();
}

class _Frame_ForgotPState extends State<Frame_ForgotP> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            image: AssetImage('assets/img_5.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                width: size.width / 3,
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'Lấy lại mật khẩu',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.width,
                child: Text(
                  'Nhập Email của bạn và chúng tôi sẽ gửi cho bạn một liên kết đặt lại mật khẩu',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
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
                  color: Colors.black.withOpacity(0.8),
                ),
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
                  color: Colors.black.withOpacity(0.8),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: email,
                        cursorColor: Colors.orange,
                        textInputAction: TextInputAction.done,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Vui lòng nhập đúng Email'
                                : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: resetPasssword,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            'ĐẶT LẠI MẬT KHẨU',
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Future resetPasssword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      // Utils.showSnackBar('Email đặt lại mật khẩu đã được gửi');
      final snackBar = SnackBar(
          content: Text('Đã gửi mật khẩu qua Email, vùi lòng kiểm tra Email'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).popUntil(
        (route) => route.isFirst,
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Navigator.of(context).pop();
    }
  }

}
