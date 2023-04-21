import 'package:door_manager/constants.dart';
import 'package:door_manager/models/home.dart';
import 'package:door_manager/pages/components/custome_drawer.dart';
import 'package:door_manager/pages/room_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
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
                      const Text(
                        "27\u00b0",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 90,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(8),
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
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: KMainText,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
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
                  Container(
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
                        userAvatar(
                            "https://randomuser.me/api/portraits/men/51.jpg"),
                        userAvatar(
                            "https://randomuser.me/api/portraits/women/13.jpg"),
                        userAvatar(
                            "https://randomuser.me/api/portraits/women/45.jpg"),
                        userAvatar(
                            "https://randomuser.me/api/portraits/women/87.jpg"),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: KMainText.withOpacity(.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: RoomCard(homeData: smartHome)),
        ],
      )),
    );
  }

  Container userAvatar(String url) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: KMainText.withOpacity(.1),
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(url))),
    );
  }
}


//Sign out

// onPressed: () {
// FirebaseAuth.instance.signOut().then((value) {
// print("Signed out");
// Navigator.pushNamed(context, '/signin');
// });
// },