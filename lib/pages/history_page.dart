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
        border: Border.all(width: 1, color: KMainText.withOpacity(.5)),
        borderRadius: BorderRadius.circular(29),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 5,
              color: KMainText.withOpacity(.15))
        ],
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
                    Icons.person_outline,
                    color: KMainText,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Person: ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: KMainText),
                  ),
                  Text(
                    history['Person'],
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
              Row(
                children: [
                  Icon(
                    Icons.lock_open,
                    color: KMainText,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Status: ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: KMainText),
                  ),
                  Text(
                    history['Status'] ? "Success" : "Fail",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: history['Status'] ? Colors.green : Colors.red),
                  ),
                ],
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
                    history["Time"],
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
              memberRef.child(history['key']).remove();
            },
            icon: Icon(Icons.delete),
            color: Color.fromARGB(255, 214, 63, 52),
          )
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
        padding: EdgeInsets.all(14),
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
