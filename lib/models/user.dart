// class User {
//   String imagePath;
//   String name;
//   String uid;
//   String email;
//   String phoneNumber;

//   User({
//     required this.imagePath,
//     required this.name,
//     required this.email,
//     required this.uid,
//     required this.phoneNumber,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       imagePath: json['imagePath'],
//       name: json['name'],
//       email: json['email'],
//       uid: json['uid'],
//       phoneNumber: json['phoneNumber'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'imagePath': imagePath,
//       'name': name,
//       'email': email,
//       'uid': uid,
//       'phoneNumber': phoneNumber,
//     };
//   }
// }