import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:io';
import '../constants.dart';
import 'components/appbar_widget.dart';

// class AuthService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future<String?> getLoggedInUserEmail() async {
//     final user = _firebaseAuth.currentUser;
//     if (user != null) {
//       return user.email;
//     }
//     return null;
//   }

//   User getCurrentUser() {
//     final user = _firebaseAuth.currentUser;
//     if (user != null) {
//       return User(
//         name: user.displayName ?? '',
//         email: user.email ?? '',
//         imagePath: user.photoURL ?? '',
//         phoneNumber: user.phoneNumber ?? '',
//         uid: user.uid,
//       );
//     } else {
//       return User();
//     }
//   }
// }

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   DatabaseReference _userRef = FirebaseDatabase.instance.reference().child('users');

//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _phoneNumberController = TextEditingController();
//   File? _image;
//   bool isEditMode = false;

//   String? loggedInEmail;
//   final AuthService _authService = AuthService();

//   Future getImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().getImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   void _updateProfile() {
//     setState(() {
//       _emailController.text = loggedInEmail!;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getEmail();
//     //_updateProfile();
//   }

//   Future<void> _getEmail() async {
//     final email = await _authService.getLoggedInUserEmail();
//     setState(() {
//       loggedInEmail = email;
//     });
//     _updateProfile();
//   }

//   Widget buildProfileCard(User user) {
//     return Card(
//       child: ListTile(
//         title: Text(user.name ?? ''),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Email: ${user.email ?? ''}'),
//             Text('Phone: ${user.phoneNumber ?? ''}'),
//             Text('UID: ${user.uid ?? ''}'),
//           ],
//         ),
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(user.imagePath ?? ''),
//           radius: 30,
//         ),
//       ),
//     );
//   }

//   Future<void> _updateProfileData() async {
//     final user = _authService.getCurrentUser();
//     if (user != null) {
//       final userId = user.uid;
//       await _userRef.child(userId!).update({
//         'name': _nameController.text,
//         'email': _emailController.text,
//         'phoneNumber': _phoneNumberController.text,
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: StreamBuilder(
//         stream: _userRef.onValue,
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
//             final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
//             final users = data.values
//                 .where((value) => value['email'] == loggedInEmail)
//                 .map<User>((value) {
//               return User(
//                 name: value['name'] ?? '',
//                 email: value['email'] ?? '',
//                 imagePath: value['imgURL'] ?? '',
//                 phoneNumber: value['phoneNumber'] ?? '',
//                 uid: value['userId'] ?? '',
//               );
//             }).toList();

//             if (users.isNotEmpty) {
//               final user = users[0];
//               _nameController.text = user.name ?? '';
//               _emailController.text = user.email ?? '';
//               _phoneNumberController.text = user.phoneNumber ?? '';
//             }

//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 final user = users[index];

//                 return Column(
//                   children: [
//                     SizedBox(height: 20),
//                     GestureDetector(
//                       onTap: () async {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: Text('Change Profile Picture'),
//                               content: SingleChildScrollView(
//                                 child: ListBody(
//                                   children: <Widget>[
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         getImage(ImageSource.camera);
//                                         Navigator.pop(context);
//                                       },
//                                       child: Text('Take a picture'),
//                                       style: ElevatedButton.styleFrom(
//                                         primary: Colors.blue,
//                                         onPrimary: Colors.white,
//                                       ),
//                                     ),
//                                     SizedBox(height: 20),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         getImage(ImageSource.gallery);
//                                         Navigator.pop(context);
//                                       },
//                                       child: Text('Select from gallery'),
//                                       style: ElevatedButton.styleFrom(
//                                         primary: Colors.blue,
//                                         onPrimary: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       },
//                       child: CircleAvatar(
//                         backgroundImage: NetworkImage(user.imagePath ?? ''),
//                         radius: 70,
//                         child: Icon(
//                           Icons.camera_alt,
//                           color: Colors.white,
//                         ),
//                         backgroundColor: Colors.grey[400],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         children: [
//                           TextField(
//                             controller: _nameController,
//                             decoration: InputDecoration(labelText: 'Name'),
//                             onChanged: (name) {},
//                           ),
//                           SizedBox(height: 10),
//                           TextField(
//                             controller: _emailController,
//                             decoration: InputDecoration(labelText: 'Email'),
//                             onChanged: (email) {},
//                           ),
//                           SizedBox(height: 10),
//                           TextField(
//                             controller: _phoneNumberController,
//                             decoration: InputDecoration(labelText: 'Phone Number'),
//                             onChanged: (phoneNumber) {},
//                           ),
//                           SizedBox(height: 16),
//                           Text(
//                             'User ID: ${user.uid ?? ''}',
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('Update Profile'),
//                 content: SingleChildScrollView(
//                   child: ListBody(
//                     children: <Widget>[
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             isEditMode = true;
//                           });
//                           _updateProfileData();
//                           Navigator.pop(context);
//                         },
//                         child: Text('Update'),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.green,
//                           onPrimary: Colors.white,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             isEditMode = false;
//                           });
//                           Navigator.pop(context);
//                         },
//                         child: Text('Cancel'),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.red,
//                           onPrimary: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//         child: Icon(Icons.edit),
//       ),
//     );
//   }
// }

// class User {
//   final String? name;
//   final String? email;
//   final String? imagePath;
//   final String? phoneNumber;
//   final String? uid;

//   User({
//     this.name,
//     this.email,
//     this.imagePath,
//     this.phoneNumber,
//     this.uid,
//   });
// }

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> getLoggedInUserEmail() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return user.email;
    }
    return null;
  }

  User getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return User(
        name: user.displayName ?? '',
        email: user.email ?? '',
        imagePath: user.photoURL ?? '',
        phoneNumber: user.phoneNumber ?? '',
        uid: user.uid,
      );
    } else {
      return User();
    }
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DatabaseReference _userRef =
      FirebaseDatabase.instance.reference().child('users');

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  File? _image;
  bool isEditMode = false;

  String? loggedInEmail;
  final AuthService _authService = AuthService();

  // Future getImage(ImageSource source) async {
  //   final pickedFile = await ImagePicker().getImage(source: source);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }

  void _updateProfile() {
    setState(() {
      _emailController.text = loggedInEmail!;
    });
  }

  @override
  void initState() {
    super.initState();
    _getEmail();
    //_updateProfile();
  }

  Future<void> _getEmail() async {
    final email = await _authService.getLoggedInUserEmail();
    setState(() {
      loggedInEmail = email;
    });
    _updateProfile();
  }

  Widget buildProfileCard(User user) {
    return Card(
      child: ListTile(
        title: Text(user.name ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${user.email ?? ''}'),
            Text('Phone: ${user.phoneNumber ?? ''}'),
            Text('UID: ${user.uid ?? ''}'),
          ],
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.imagePath ?? ''),
          radius: 30,
        ),
      ),
    );
  }

  Future<void> _updateProfileData() async {
    final user = _authService.getCurrentUser();
    if (user != null) {
      final userId = user.uid;
      await _userRef.child(userId!).update({
        'name': _nameController.text,
        'email': _emailController.text,
        'phoneNumber': _phoneNumberController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Profile", null),
      body: StreamBuilder(
        stream: _userRef.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
            final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
            final users = data.values
                .where((value) => value['email'] == loggedInEmail)
                .map<User>((value) {
              return User(
                name: value['name'] ?? '',
                email: value['email'] ?? '',
                imagePath: value['imgURL'] ?? '',
                phoneNumber: value['phoneNumber'] ?? '',
                uid: value['userId'] ?? '',
              );
            }).toList();

            if (users.isNotEmpty) {
              final user = users[0];
              _nameController.text = user.name ?? '';
              _emailController.text = user.email ?? '';
              _phoneNumberController.text = user.phoneNumber ?? '';
            }

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return Column(
                  children: [
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Change Profile Picture'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {
                                        //getImage(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                      child: Text('Take a picture'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        onPrimary: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        // getImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                      child: Text('Select from gallery'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        onPrimary: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.imagePath ?? ''),
                        radius: 70,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.grey[400],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              focusColor: KMainText,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(29),
                                  borderSide:
                                      BorderSide(width: 1, color: KMainText)),
                              labelText: 'Name',
                              labelStyle: TextStyle(color: KMainText),
                              prefixIcon: Icon(
                                Icons.person,
                                color: KMainText,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(29),
                              ),
                            ),
                            onChanged: (name) {},
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              focusColor: KMainText,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(29),
                                  borderSide:
                                      BorderSide(width: 1, color: KMainText)),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: KMainText),
                              prefixIcon: Icon(
                                Icons.email,
                                color: KMainText,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(29)),
                            ),
                            onChanged: (email) {},
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                              focusColor: KMainText,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(29),
                                  borderSide:
                                      BorderSide(width: 1, color: KMainText)),
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(color: KMainText),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: KMainText,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(29)),
                            ),
                            onChanged: (phoneNumber) {},
                          ),
                          SizedBox(height: 20),
                          Text(
                            'User ID: ${user.uid ?? ''}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: KMainText.withOpacity(.7)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Code for admin: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: KMainText.withOpacity(.7)),
                              ),
                              Text(
                                'vip',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Code for member: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: KMainText.withOpacity(.7)),
                              ),
                              Text(
                                'normal',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: KMainText.withOpacity(.8),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Update Profile'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isEditMode = true;
                          });
                          _updateProfileData();
                          Navigator.pop(context);
                        },
                        child: Text('Update'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 92, 196, 96),
                          onPrimary: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isEditMode = false;
                          });
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 226, 85, 75),
                          onPrimary: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

class User {
  final String? name;
  final String? email;
  final String? imagePath;
  final String? phoneNumber;
  final String? uid;

  User({
    this.name,
    this.email,
    this.imagePath,
    this.phoneNumber,
    this.uid,
  });
}
