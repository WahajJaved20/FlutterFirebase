import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/models/brew.dart';
import 'package:firebasetest/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    brews.forEach((brew) {
      print(brew.name);
      print(brew.sugars);
      print(brew.strength);
    });
    return ListView.builder(
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
      itemCount: brews.length,
    );
  }
}
