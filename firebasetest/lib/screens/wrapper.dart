import 'package:firebasetest/models/user.dart';
import 'package:firebasetest/screens/authenticate/authenticate.dart';
import 'package:firebasetest/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    if (user == null) {
      return Authenticate();
    }
    return Home();
  }
}
