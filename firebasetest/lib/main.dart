import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/models/user.dart';
import 'package:firebasetest/screens/wrapper.dart';
import 'package:firebasetest/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
        child: MaterialApp(
          home: Wrapper(),
        ),
        value: AuthService().user,
        initialData: null);
  }
}
