import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
