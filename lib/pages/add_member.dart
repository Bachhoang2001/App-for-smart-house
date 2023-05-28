import 'package:door_manager/pages/components/appbar_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class AddMemberPage extends StatefulWidget {
  @override
  _AddMemberPageState createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  late final WebViewController _controller;
  String http = "http://";

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()..loadRequest(Uri.parse(urlAddMember()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Add Member", null),
      body: WebViewWidget(
        controller: _controller,
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
}
