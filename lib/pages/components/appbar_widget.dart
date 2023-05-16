import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title, List<Widget>? actions) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
    ),
    centerTitle: true,
    leading: BackButton(
      color: Colors.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [],
  );
}
