import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModels {
  String? userName;
  String? email;
  String? uid;
  Timestamp? accountCreated;
  UserModels({this.accountCreated, this.email, this.uid, this.userName});
}