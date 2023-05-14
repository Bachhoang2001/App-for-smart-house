import 'package:door_manager/constants.dart';
import 'package:door_manager/models/home.dart';
import 'package:door_manager/pages/components/appbar_widget.dart';
import 'package:door_manager/pages/components/textField_widget.dart';
import 'package:flutter/material.dart';

import 'components/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _user = User(
        imagePath:
            "https://kynguyenlamdep.com/wp-content/uploads/2022/06/avatar-cute-vui-nhon.jpg",
        name: "Bach",
        email: "hoangnguyenbach2002@gmail.com",
        uid: "1",
        phoneNumber: "0905804148");
    return Scaffold(
      appBar: buildAppBar(context, "Edit Profile", null),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 10,
          ),
          ProfileWidget(
            imagePath: _user.imagePath,
            onClicked: () {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: "Name",
            text: _user.name,
            onChanged: (name) {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            label: "Email",
            text: _user.email,
            onChanged: (email) {},
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
              label: "Phone Number",
              text: _user.phoneNumber,
              onChanged: (phoneNumber) {}),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: MaterialButton(
                padding: EdgeInsets.all(20),
                color: KMainText,
                onPressed: () {},
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: MaterialButton(
                padding: EdgeInsets.all(20),
                color: Color.fromARGB(255, 92, 199, 124),
                onPressed: () {},
                child: Text(
                  "Change password",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
