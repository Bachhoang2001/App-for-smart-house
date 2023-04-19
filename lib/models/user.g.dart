part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) => User(
    uid: json['uid'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber
    };
