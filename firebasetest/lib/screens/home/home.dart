// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/models/brew.dart';
import 'package:firebasetest/screens/home/brew_list.dart';
import 'package:firebasetest/services/auth.dart';
import 'package:firebasetest/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
            title: Text("Home"),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                label: Text("Log out"),
                icon: Icon(Icons.person),
              ),
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.settings),
                  label: Text("Settings"))
            ]),
        body: BrewList(),
      ),
    );
  }
}
