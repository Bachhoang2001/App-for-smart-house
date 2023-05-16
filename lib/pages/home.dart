import 'dart:io';

import 'package:door_manager/constants.dart';
import 'package:door_manager/models/home.dart';
import 'package:door_manager/pages/add_images.dart';
import 'package:door_manager/pages/add_member.dart';
import 'package:door_manager/pages/components/custome_drawer.dart';
import 'package:door_manager/pages/room_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  String imageURL = "";
  String http = "http://";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: CustomDrawer(),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (context) {
                      return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(Icons.menu));
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Hi Bach",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Welcome to your home !",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: KMainText.withOpacity(.5),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(1),
                      child: Row(
                        children: [
                          Text(
                            "Temperature of home: ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "27\u00b0",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      color: Colors.black.withOpacity(.1))
                                ],
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    bottomLeft: Radius.circular(35))),
                            child: Row(
                              children: [
                                Text(
                                  "Add Member",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 43,
                                  height: 43,
                                  decoration: BoxDecoration(
                                    color: KMainText.withOpacity(.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    onTap: () async {
                                      final ref =
                                          FirebaseDatabase.instance.ref();
                                      final snapshot =
                                          await ref.child('URL').get();
                                      String url = snapshot.value.toString();
                                      final c = http + url;
                                      print(c);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return AddMemberPage();
                                      }));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: RoomCard(homeData: smartHome)),
          ],
        )),
      ),
    );
  }

  Container userAvatar(String url) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: KMainText.withOpacity(.1),
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(url))),
    );
  }
}
