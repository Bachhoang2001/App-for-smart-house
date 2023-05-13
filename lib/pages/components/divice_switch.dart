import 'package:door_manager/constants.dart';
import 'package:door_manager/models/home.dart';
import 'package:flutter/material.dart';

class DeviceSwitch extends StatefulWidget {
  const DeviceSwitch({super.key, required this.data});
  final DeviceInHome data;
  @override
  State<DeviceSwitch> createState() => _DeviceSwitchState();
}

class _DeviceSwitchState extends State<DeviceSwitch> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final DeviceInHome data = this.widget.data;
    final Duration _duration = Duration(milliseconds: 300);

    return GestureDetector(
      onTap: () {
        setState(() {
          data.deviceStatus = !data.deviceStatus;
        });
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
              top: !data.deviceStatus ? 0 : -size.height * 0.22 / 2,
              duration: _duration,
              child: Column(
                children: [
                  _deviceStatus(data),
                  _deviceName(size, data),
                ],
              ),
            ),
            AnimatedPositioned(
              bottom: data.deviceStatus ? 0 : -size.height * 0.22 / 2,
              duration: _duration,
              child: Column(
                children: [
                  _deviceName(size, data),
                  _deviceStatus(data),
                ],
              ),
            ),
            AnimatedPositioned(
              top: data.deviceStatus ? 0 : (size.height * 0.22 / 2) + 10,
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
                  data.deviceStatus ? data.iconOn : data.iconOff,
                  color: KMainText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _deviceName(Size size, DeviceInHome data) {
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
        data.deviceStatus ? "On" : "Off",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
