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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: KMainText,
              ),
              SizedBox(width: 8),
              Text(
                "Name: ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: KMainText),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                member['Name'],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(.5)),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.delete),
                color: Color.fromARGB(255, 214, 63, 52),
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
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map member = snapshot.value as Map;
            member['key'] = snapshot.key;

            return listItem(member: member);
          },
        ),
      ),
    );
  }
}
