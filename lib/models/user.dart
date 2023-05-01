import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class User {
  String name;
  String uid;
  String email;
  String phoneNumber;

  User(
      {required this.name,
      required this.email,
      required this.uid,
      required this.phoneNumber});
}
