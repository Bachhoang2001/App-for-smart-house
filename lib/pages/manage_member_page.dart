import 'package:door_manager/pages/components/appbar_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ManageMemberPage extends StatefulWidget {
  @override
  _ManageMemberPageState createState() => _ManageMemberPageState();
}

class _ManageMemberPageState extends State<ManageMemberPage> {
  Query dbRef = FirebaseDatabase.instance.ref().child("Member");

  Widget listItem({required Map member}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              "Person: ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              member['Name'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Divider(
          color: Colors.grey[300],
          height: 1,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                // Xử lý hành động xóa thành viên tại đây
                // Ví dụ: Gọi hàm xóa thành viên từ DatabaseReference
                DatabaseReference memberRef =
                    FirebaseDatabase.instance.ref().child("Member");
                memberRef.child(member['key']).remove();
              },
            ),
          ],
        ),
      ],
    ),
  );
}

Widget build(BuildContext context) {
  final DatabaseReference memberRef = FirebaseDatabase.instance.ref();

  return Scaffold(
    appBar: buildAppBar(context, "Manage Member", null),
    body: Container(
      padding: const EdgeInsets.all(16),
      child: FirebaseAnimatedList(
        query: dbRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
          Map member = snapshot.value as Map;
          member['key'] = snapshot.key;

          return listItem(member: member);
        },
      ),
    ),
  );
}
}
