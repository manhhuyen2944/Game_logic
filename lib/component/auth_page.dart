import 'package:flutter/material.dart';
import 'package:project_threeh/Accouts/Frame_Login.dart';
import 'package:project_threeh/Accouts/Frame_Resgireter.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? FrameLogin(
          onClickedSignUp: toggle,
        )
      : Frame_Register(
          onClickedSignIn: toggle,
        );

  void toggle() => setState(
        () => isLogin = !isLogin,
      );
}
