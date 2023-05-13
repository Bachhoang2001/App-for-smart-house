import 'dart:io';

import 'package:door_manager/constants.dart';
import 'package:door_manager/models/home.dart';
import 'package:door_manager/pages/add_images.dart';
import 'package:door_manager/pages/components/custome_drawer.dart';
import 'package:door_manager/pages/room_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  String imageURL = "";
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
                            child: InkWell(
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AddImage()));
                                //_showMyDialog(context);
                              },
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

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'How to add Person',
            style: TextStyle(color: KMainText, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You need 5 more photos for 5 corners of your face.'),
                Text(""),
                Text('Would you like to add new Person for your home?'),
                Text(""),
                Text("Enter the name of the person you want to add."),
                TextField(
                  controller: nameTextEditingController,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      labelText: "Name", border: InputBorder.none),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Approve',
                style: TextStyle(color: KMainText, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                // ImagePicker imagePicker = ImagePicker();
                // XFile? file =
                //     await imagePicker.pickImage(source: ImageSource.gallery);
                // print('${file?.path}');
                // if (file == null) return;
                // String uniqueFileName = nameTextEditingController.text;
                // Reference referenceRoot = FirebaseStorage.instance.ref();
                // Reference referenceDirImages = referenceRoot.child('data');
                // Reference referenceDIrFolders =
                //     referenceDirImages.child(uniqueFileName);
                // Reference referenceImagesToUpload =
                //     referenceDIrFolders.child('1');
                // await referenceImagesToUpload.putFile(File(file.path));
                // imageURL = await referenceImagesToUpload.getDownloadURL();
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style:
                      TextStyle(color: KMainText, fontWeight: FontWeight.bold),
                ))
          ],
        );
      },
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