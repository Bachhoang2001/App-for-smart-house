import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';

class History {
  String id;
  String time;
  String person;
  Bool status;

  History(
      {required this.id,
      required this.time,
      required this.person,
      required this.status});

  // History.fromSnapshot(DataSnapshot snapshot)
  //     : id = snapshot.key,
  //       time = snapshot.value["Time"],
  //       person = snapshot.value!["Person"],
  //       status = snapshot.value["Status"];

  toJson() {
    return {
      "Person": person,
      "Status": status,
    };
  }
}
