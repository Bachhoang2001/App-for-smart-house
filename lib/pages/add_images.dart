import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

import '../constants.dart';

class AddImage extends StatefulWidget {
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  TextEditingController nameTextEditingController = TextEditingController();
  late CollectionReference imgRef;
  late firebase_storage.Reference ref;
  List<File> _image = [];
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Image"),
        actions: [
          FloatingActionButton(
            onPressed: () {
              uploadFile().whenComplete(() => Navigator.of(context).pop());
            },
            child: Text('Upload'),
          )
        ],
      ),
      body: GridView.builder(
        itemCount: _image.length + 1,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return index == 0
              ? Center(
                  child: IconButton(
                      onPressed: () {
                        chooseImage();
                      },
                      icon: Icon(Icons.add)),
                )
              : Container(
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(_image[index - 1]),
                          fit: BoxFit.cover)),
                );
        },
      ),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    for (var img in _image) {
      String uniqueName = nameTextEditingController.text;
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child("data/$uniqueName/${Path.basename(img.path)}");
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.add({'url': value});
        });
      });
    }
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

  // @override
  // void initState() {
  //   super.initState();
  //   imgRef = Firebase
  // }
}
