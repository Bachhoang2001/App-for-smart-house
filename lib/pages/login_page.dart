import 'package:door_manager/constants.dart';
import 'package:door_manager/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:door_manager/pages/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;

  @override
  void initState() {
    passwordVisible = true;
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
                  "assets/images/main_top.png",
                  width: size.width * 0.35,
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
              left: size.width * 0.41,
              child: Text('Login',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: KMainText)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "assets/images/ava2.jpg",
                  width: size.width * 0.5,
                  height: size.height * 0.3,
                ),
                SizedBox(
                  height: 30,
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
                  height: 40,
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
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.035),
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
                      "Don't have an account ? ",
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
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
