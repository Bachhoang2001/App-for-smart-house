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
      body: new Center(
        child: InkWell(
          onTap: () {
            _launchUrl();
          },
          child: Text('URL link'),
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
