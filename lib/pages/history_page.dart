import 'package:door_manager/constants.dart';
import 'package:door_manager/pages/components/appbar_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Query dbRef = FirebaseDatabase.instance.ref().child('History');

  Widget listItem({required Map history}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black38),
          borderRadius: BorderRadius.circular(29),
          color: KMainText.withOpacity(.5)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(
                width: 2,
              ),
              Text(
                "Person: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                history['Person'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.lock_open),
              SizedBox(
                width: 2,
              ),
              Text(
                "Status: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                history['Status'] ? "Success" : "Fail",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.punch_clock),
              SizedBox(
                width: 2,
              ),
              Text(
                "Time: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                history["Time"],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final DatabaseReference historyRef = FirebaseDatabase.instance.ref();

    return Scaffold(
      appBar: buildAppBar(context, "History", null),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map history = snapshot.value as Map;
            history['key'] = snapshot.key;

            return listItem(history: history);
          },
        ),
      ),
    );
  }
}
