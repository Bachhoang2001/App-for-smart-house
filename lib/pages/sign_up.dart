import 'package:flutter/material.dart';
import 'package:door_manager/constants.dart';
import 'package:door_manager/pages/home.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisible = false;
  bool passwordConform = false;

  @override
  void initState() {
    passwordVisible = true;
    passwordConform = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                  width: size.width * 0.29,
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/login_bottom.png",
                  width: size.width * 0.4,
                )),
            Positioned(
              top: 10,
              left: size.width * 0.38,
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  height: size.height / 11,
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: KMainText,
                        ),
                        labelText: "Your Email",
                        hintText: "abc@gmail.com",
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  height: size.height / 11,
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  height: size.height / 11,
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  height: size.height / 11,
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    obscureText: passwordConform,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: KMainText,
                        ),
                        labelText: "Confirm Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordConform
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: KMainText,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                passwordConform = !passwordConform;
                              },
                            );
                          },
                        ),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width * 0.8,
                  height: size.height / 13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: MaterialButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: KMainText,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.035),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
