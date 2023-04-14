import 'package:door_manager/pages/login_page.dart';
import 'package:door_manager/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:door_manager/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/semantics.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: size.width * 0.3,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: size.width * 0.2,
              )),
          SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "Welcome to Door Manager",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: KMainText,
                      letterSpacing: 0.6),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Icon(
                Icons.verified_user,
                size: 140,
                color: KMainText,
              ),
              SizedBox(
                height: 120,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: size.width * 0.8,
                    height: size.height / 14,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: MaterialButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: KMainText,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                        },
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.5,
                              letterSpacing: 0.8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width * 0.8,
                    height: size.height / 14,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: MaterialButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: Color.fromARGB(255, 238, 219, 247),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignupScreen();
                          }));
                        },
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.5,
                              letterSpacing: 0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              )
            ],
          )),
        ],
      ),
    );
  }
}
