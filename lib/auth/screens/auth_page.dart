import 'package:flutter/material.dart';
import 'package:fmea/auth/widgets/log_in_widget.dart';
import 'package:fmea/auth/widgets/sign_up_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    return isSignIn
        ? LogInWidget(onClickedSignUp: toggleSignIn)
        : SignUpWidget(onClickedSignIn: toggleSignIn);
  }
void toggleSignIn() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }
}
