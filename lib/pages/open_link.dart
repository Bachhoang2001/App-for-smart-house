import 'package:door_manager/constants.dart';
import 'package:door_manager/pages/components/appbar_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenLink extends StatefulWidget {
  @override
  _OpenLinkState createState() => _OpenLinkState();
}

class _OpenLinkState extends State<OpenLink> {
  String http = "http://";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Add Member", null),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              'Click the below link to add a new member: ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                _launchUrl();
              },
              child: Text(
                'Link to add member',
                style:
                    TextStyle(color: KMainText.withOpacity(.8), fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  urlAddMember() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('URL').get();
    String url = snapshot.value.toString();
    final c = http + url;
    print(c);
    return c;
  }

  _launchUrl() async {
    try {
      String url = await urlAddMember();
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
