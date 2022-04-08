import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/models/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');
  Future updateUserData(String sugars, String user, String strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': user, 'strength': strength});
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Brew(
          name: e['name'] ?? '',
          sugars: e['sugars'] ?? '0',
          strength: e['strength'] ?? 0);
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
