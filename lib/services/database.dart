import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugar, String name, int strength) async{
    return await brewCollection.doc(uid).set({
      "sugar" : sugar,
      "name" : name,
      "strength" : strength,
    });
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      sugar: snapshot.data()['sugar'],
      name: snapshot.data()['name'],
      strength : snapshot.data()['strength'],
    );
  }

  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((document) {
      return Brew(
        sugars: document.data()['sugar'] ?? "0",
        name: document.data()['name'] ?? "",
        strength: document.data()['strength'] ?? 0,
      );
    }).toList();
  }

  // Stream for brew changes
  Stream<List<Brew>> get brews{
    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData{
      return brewCollection.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
}
}