import 'dart:async';
import 'dart:ffi';

import 'package:door_manager/constants.dart';
import 'package:door_manager/models/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DeviceSwitch extends StatefulWidget {
  const DeviceSwitch({super.key, required this.data});
  final DeviceInHome data;
  @override
  State<DeviceSwitch> createState() => _DeviceSwitchState();
}

class _DeviceSwitchState extends State<DeviceSwitch> {
  late DatabaseReference _databaseRef;
  bool _statusDevice = false;

  @override
  void initState() {
    super.initState();
    _databaseRef =
        FirebaseDatabase.instance.ref().child("HomeModel/devices/statusDevice");
    _fetchStatusDevice();
  }

  Future<void> _fetchStatusDevice() async {
    DatabaseEvent event = await _databaseRef.once();
    if (event.snapshot != null) {
      bool? value = event.snapshot.value as bool?;
      if (value != null) {
        setState(() {
          _statusDevice = value;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DeviceInHome data = this.widget.data;
    final Duration _duration = Duration(milliseconds: 300);

    return GestureDetector(
      onTap: () {
        setState(() {
          _statusDevice = !_statusDevice;
          DatabaseReference pushRef = FirebaseDatabase.instance
              .ref()
              .child("HomeModel/devices/statusDevice");
          pushRef.set(_statusDevice).then((_) {
            print("statusDevice value updated successfully.");
          }).catchError((error) {
            print("Failed to update statusDevice value: $error");
          });
        });
        if (_statusDevice == true) {
          Timer(Duration(seconds: 10), () {
            _statusDevice = false;
            DatabaseReference pushRefAgain = FirebaseDatabase.instance
                .ref()
                .child("HomeModel/devices/statusDevice");
            pushRefAgain.set(_statusDevice).then((_) {
              print("statusDevice value updated successfully.");
            }).catchError((error) {
              print("Failed to update statusDevice value: $error");
            });
          });
        }
      },
      child: Container(
        width: size.width * 0.22,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.3),
            borderRadius: BorderRadius.circular(60)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              top: !_statusDevice ? 0 : -size.height * 0.22 / 2,
              duration: _duration,
              child: Column(
                children: [
                  _deviceStatus(data),
                  _deviceName(size, data),
                ],
              ),
            ),
            AnimatedPositioned(
              bottom: _statusDevice ? 0 : -size.height * 0.22 / 2,
              duration: _duration,
              child: Column(
                children: [
                  _deviceName(size, data),
                  _deviceStatus(data),
                ],
              ),
            ),
            AnimatedPositioned(
              top: _statusDevice ? 0 : (size.height * 0.22 / 2) + 10,
              duration: _duration,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 20,
                      ),
                    ]),
                child: Icon(
                  _statusDevice ? Icons.lock_outline : Icons.lock_open_outlined,
                  color: KMainText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _deviceName(size, DeviceInHome data) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: size.width * 0.22 - 16,
      child: Text(
        data.deviceName,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: const TextStyle(
          color: Colors.white,
          overflow: TextOverflow.ellipsis,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.2,
        ),
      ),
    );
  }

  Padding _deviceStatus(DeviceInHome data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _statusDevice ? "Open" : "Close",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
