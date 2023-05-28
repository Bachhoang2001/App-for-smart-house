import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:door_manager/constants.dart';

AppBar buildAppBar(BuildContext context, String title, List<Widget>? actions) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 25,
        color: KMainText,
      ),
    ),
    centerTitle: true,
    leading: BackButton(
      color: KMainText,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [],
  );
}
