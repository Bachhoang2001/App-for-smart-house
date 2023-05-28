import 'package:door_manager/pages/components/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import '../constants.dart';

class WarningPage extends StatefulWidget {
  @override
  _WarningPageState createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Warning');

  Widget listItem({required Map warning}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.circular(29),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.doorbell_outlined,
                    color: KMainText,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Warning: ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: KMainText),
                  ),
                  Text(
                    warning['Content'],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(.5)),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.5,
              ),
              SizedBox(
                height: 5.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: KMainText,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Time: ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: KMainText),
                  ),
                  Text(
                    warning["Time"],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(.5)),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              DatabaseReference memberRef =
                  FirebaseDatabase.instance.ref().child("History");
              memberRef.child(warning['key']).remove();
            },
            icon: Icon(Icons.delete),
            color: Color.fromARGB(255, 214, 63, 52),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Warning', null),
      body: Container(
        padding: EdgeInsets.all(14),
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map warning = snapshot.value as Map;
            warning['key'] = snapshot.key;

            return listItem(warning: warning);
          },
        ),
      ),
    );
  }
}
