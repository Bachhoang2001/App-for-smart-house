import 'package:door_manager/constants.dart';
import 'package:door_manager/models/home.dart';
import 'package:door_manager/pages/room_control_screen.dart';
import 'package:door_manager/pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:door_manager/pages/home.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController resetEmailTextEditingController =
      TextEditingController();

  // Check if the sign in is success or not
  bool isNotSuccess = false;

  // Check if the fields are empty
  bool isEmpty = false;

  // Show password controller
  bool passwordVisible = false;

  // Show loading spinner in async task
  bool showSpinner = false;

  Icon suffixIconController = Icon(
    Icons.visibility,
    color: KMainText,
  );

  void resetForm() {
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
    setState(() {
      isNotSuccess = false;
      isEmpty = false;
      passwordVisible = false;
      showSpinner = false;
    });
  }

  void onTapShowPassword() {
    if (passwordVisible == true) {
      setState(() {
        passwordVisible = false;
        suffixIconController = Icon(
          Icons.visibility,
          color: KMainText,
        );
      });
    } else {
      setState(() {
        passwordVisible = true;
        suffixIconController = Icon(
          Icons.visibility_off,
          color: KMainText,
        );
      });
    }
  }

  Future<void> validatingEmailAddress(
      BuildContext context, Function setState) async {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(resetEmailTextEditingController.text);
  }

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_top.png",
                    width: size.width * 0.35,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/login_bottom.png",
                    width: size.width * 0.4,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: size.width * 0.37,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: KMainText,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/ava2.jpg",
                      width: size.width * 0.5,
                      height: size.height * 0.3,
                    ),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      height: size.height / 11,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        style: TextStyle(color: KMainText),
                        cursorColor: KMainText,
                        controller: emailTextEditingController,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: KMainText,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(color: KMainText),
                          hintText: "abc@gmail.com",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      height: size.height / 11,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        cursorColor: KMainText,
                        controller: passwordTextEditingController,
                        obscureText: passwordVisible,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          icon: Icon(
                            Icons.lock,
                            color: KMainText,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: KMainText),
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: KMainText,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 220),
                        Container(
                          padding: EdgeInsets.only(top: 15, left: 20),
                          child: InkWell(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                color: KMainText,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: size.width * 0.8,
                      height: size.height / 13,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: MaterialButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          color: KMainText,
                          onPressed: () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: emailTextEditingController.text,
                              password: passwordTextEditingController.text,
                            )
                                .then((value) async {
                              if (value.user != null) {
                                print(value.user?.uid.toString());
                                String uid = value.user!.uid.toString();
                                final dbRef = FirebaseDatabase.instance
                                    .ref()
                                    .child("users")
                                    .child(uid)
                                    .child('code');
                                final snapshot = await dbRef.get();
                                String codeUser = snapshot.value.toString();
                                if (codeUser == "vip") {
                                  Navigator.pushReplacementNamed(
                                      context, "/home");
                                } else if (codeUser == "normal") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RoomControl(
                                              homeData: smartHome)));
                                }

                                // DatabaseEvent event = await dbRef.once();
                                // Map<dynamic, dynamic>? usersData = event
                                //     .snapshot.value as Map<dynamic, dynamic>?;
                                // if (usersData != null) {
                                //   String desiredUserKey = '';
                                //   String a = "t92NoozwPeQQ5vN0jV47UWQDfUv1";
                                //   usersData.forEach((userKey, userData) {
                                //     Map<dynamic, dynamic>? userDataMap =
                                //         userData as Map<dynamic, dynamic>?;
                                //     if (userDataMap != null &&
                                //         userDataMap['userID'] == a) {
                                //       print(userKey);
                                //       desiredUserKey = userKey;
                                //       return;
                                //     }
                                //   });

                                //   if (desiredUserKey.isNotEmpty) {
                                //     final desiredUserRef =
                                //         dbRef.child(desiredUserKey);
                                //     DatabaseEvent desiredUserEvent =
                                //         await desiredUserRef.once();
                                //     Map<dynamic, dynamic>? desiredUserData =
                                //         desiredUserEvent.snapshot.value
                                //             as Map<dynamic, dynamic>?;
                                //     if (desiredUserData != null) {
                                //       String desiredUserCode =
                                //           desiredUserData['code'] as String ??
                                //               '';
                                //       print(desiredUserCode);
                                //     } else {
                                //       print("Desired user data is null");
                                //     }
                                //   } else {
                                //     print("Desired user key is empty");
                                //   }
                                // } else {
                                //   print("Member data is null");
                                // }
                              }
                            }).catchError((error) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        title: Text(
                                          'Warning',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        content: Text(
                                            'The email or password invalid !'),
                                        actions: [
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Ok',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ));
                              print("Error: ${error.toString()}");
                            });
                          },
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: kPrimaryLightColor),
                        ),
                        InkWell(
                          child: Text(
                            'Sign up',
                            style: TextStyle(color: KMainText),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignupScreen();
                            }));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
