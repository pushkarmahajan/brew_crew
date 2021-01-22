
import 'package:firebase_auth/firebase_auth.dart';

class CusUser {
  final String uid;

  CusUser({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String sugar;
  final int strength;
  UserData({this.uid, this.name, this.sugar, this.strength});
}