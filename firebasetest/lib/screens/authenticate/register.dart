// ignore_for_file: prefer_const_constructors

import 'package:firebasetest/shared/constants.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../../shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggle;
  Register({this.toggle});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text("Sign up and Register: "),
              actions: <Widget>[
                ElevatedButton.icon(
                    onPressed: () {
                      widget.toggle();
                    },
                    icon: Icon(Icons.person),
                    label: Text("Sign in"))
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'email'),
                      validator: (val) => val.isEmpty ? "Enter an email" : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'password'),
                      validator: (val) => val.length < 6
                          ? "Enter a password with more than 6 chars"
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(
                                () => error = 'Please enter valid credentials');
                            loading = false;
                          }
                        }
                      },
                      child: Text("Register",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red[100]),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
