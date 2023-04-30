import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

// class User {
//   String name;
//   String uid;
//   String email;
//   String phoneNumber;

//   User(
//       {required this.name,
//       required this.email,
//       required this.uid,
//       required this.phoneNumber});

//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }
@JsonSerializable()
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

  Future<void> saveToFirestore() async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
      });
    } catch (e) {
      print('Error saving user to Firestore: $e');
    }
  }

  static Future<User?> fromFirestore(String uid) async {
    try {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (doc.exists) {
        final userData = doc.data()!;
        return User(
          uid: uid,
          name: userData['name'],
          email: userData['email'],
          phoneNumber: userData['phoneNumber'],
        );
      } else {
        return null;
      }
    } catch (e) {
      print('Error retrieving user from Firestore: $e');
      return null;
    }
  }
}

