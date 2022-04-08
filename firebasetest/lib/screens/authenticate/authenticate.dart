import 'package:firebasetest/screens/authenticate/register.dart';
import 'package:firebasetest/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext coontext) {
    return Container(
      child: showSignIn
          ? SignIn(toggle: toggleView)
          : Register(toggle: toggleView),
    );
  }
}
