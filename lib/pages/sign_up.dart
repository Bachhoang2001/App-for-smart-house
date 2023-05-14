//import 'package:door_manager/fire_base/fire_base_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:door_manager/constants.dart';
import 'package:door_manager/pages/home.dart';
import 'package:door_manager/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void createUser(
    String name,
    String email,
    String password,
    String phoneNumber,
    Function onSuccess,
  ) async {
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = userCredential.user;

      if (user != null) {
        DatabaseReference ref =
            FirebaseDatabase.instance.reference().child("users");
        ref.child(user.uid).set({
          'name': name,
          'email': email,
          'password': password,
          'userId': user.uid,
          'phoneNumber': phoneNumber,
        }).then((_) {
          onSuccess();
        }).catchError((error) {
          print("Error saving user data: $error");
        });
      }
    } catch (error) {
      print("Error creating user: $error");
    }
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisible = false;
  bool passwordConform = false;

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  void initState() {
    passwordVisible = true;
    passwordConform = true;
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
                      "assets/images/signup_top.png",
                      width: size.width * 0.25,
                    )),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/images/login_bottom.png",
                      width: size.width * 0.4,
                    )),
                Positioned(
                  top: 20,
                  left: size.width * 0.37,
                  child: Text('Sign Up',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: KMainText)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/ava2.jpg",
                      width: size.width * 0.5,
                      height: size.height * 0.3,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      height: size.height / 11,
                      decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        controller: nameTextEditingController,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: KMainText,
                            ),
                            labelText: "Your Name",
                            border: InputBorder.none),
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
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        controller: emailTextEditingController,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: KMainText,
                            ),
                            labelText: "Your Email",
                            hintText: "abc@gmail.com",
                            border: InputBorder.none),
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
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        controller: phoneTextEditingController,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.phone,
                              color: KMainText,
                            ),
                            labelText: "Your Phone Number",
                            border: InputBorder.none),
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
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        controller: passwordTextEditingController,
                        obscureText: passwordVisible,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: KMainText,
                            ),
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: KMainText,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                            final String name = nameTextEditingController.text;
                            final String email = emailTextEditingController.text;
                            final String password = passwordTextEditingController.text;
                            final String phoneNumber = phoneTextEditingController.text;

                            final Map<String, dynamic> userInfo = {
                              'name': name,
                              'email': email,
                              'phoneNumner': phoneTextEditingController.text,
                            };

                            final FirAuth firAuth = FirAuth();

                            firAuth.createUser(
                              name,
                              email,
                              password,
                              phoneNumber,
                              () {
                                print("User created successfully");
                                Navigator.pushNamed(context, '/home');
                              },
                            );

                          },
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.035),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account ? ",
                          style: TextStyle(color: kPrimaryLightColor),
                        ),
                        InkWell(
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: KMainText),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                          },
                        )
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
