import 'dart:html';

import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class CustomRectRoundedButton extends StatelessWidget {
  const CustomRectRoundedButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 10,
        width: 10,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.2),
              offset: const Offset(0, 1),
              blurRadius: 20,
              spreadRadius: 0.5,
            )
          ],
        ),
        child: SizedBox(
          width: 10 / 1.4,
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _SettingPageState extends State<SettingPage> {
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  CustomRectRoundedButton(
                    title: "general_setting",
                    onTap: () {},
                  ),
                  CustomRectRoundedButton(
                    title: "update_app",
                    onTap: () {},
                  ),
                ],
              ))
        ],
      )),
    );
  }
}
