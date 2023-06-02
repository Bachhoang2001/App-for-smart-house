import 'package:door_manager/constants.dart';
import 'package:door_manager/pages/components/appbar_widget.dart';
import 'package:flutter/material.dart';

class GuideLine extends StatefulWidget {
  @override
  _GuideLineState createState() => _GuideLineState();
}

class _GuideLineState extends State<GuideLine> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Help', null),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "1. Add member",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/add_member.jpg",
                    width: 130,
                    height: 260,
                  ),
                  Image.asset(
                    "assets/images/stream.png",
                    width: 200,
                    height: 100,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "In Add Member page,you can see a row that says 'Link to add member'. When you click on it, will redirect you to the website so you can add members through this mobile app. On that site, there will be an 'Add user' feature so you can add new members.",
                style: TextStyle(fontSize: 16, letterSpacing: 0.3),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "2. Manage member",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Image.asset(
                "assets/images/manage_member.jpg",
                width: 130,
                height: 260,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "In this feature, you can manage all members in the system (they are the ones who can open the door by facial recognition through the 'Add member' feature). If they are no longer in the system you manage, you can remove them from the system so that they can no longer open the door to enter your home.",
                style: TextStyle(fontSize: 16, letterSpacing: 0.3),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "3. Manage history",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Image.asset(
                "assets/images/manage_history.jpg",
                width: 130,
                height: 260,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "With 'Manage History' you can control who has opened the door to enter your home. And information such as the person opening the door, opening date and time, successful or not open status are all displayed. You can delete someone's entry and exit history if necessary.",
                style: TextStyle(fontSize: 16, letterSpacing: 0.3),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "4. Warning",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/warning_red.jpg",
                    width: 100,
                    height: 200,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/images/warning_per.jpg",
                    width: 100,
                    height: 200,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/images/warning.jpg",
                    width: 100,
                    height: 200,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "The most important thing for every home is safety. The 'Warning' feature is created to warn you if someone tries to break into your home (more than 3 times) through facial recognition. If a warning appears, the 'bell' icon will turn red. It will go back to purple once you've viewed that warning.",
                style: TextStyle(fontSize: 16, letterSpacing: 0.3),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      "If you encounter any problems, do not hesitate to contact us through:",
                      style: TextStyle(
                          color: KMainText,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          size: 16,
                          color: KMainText.withOpacity(.8),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Email: pbl5app@gmail.com",
                          style: TextStyle(
                              color: KMainText.withOpacity(.8),
                              fontSize: 16,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_android,
                          color: KMainText.withOpacity(.8),
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Phone number: 0906123456",
                          style: TextStyle(
                              color: KMainText.withOpacity(.8),
                              fontSize: 16,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
