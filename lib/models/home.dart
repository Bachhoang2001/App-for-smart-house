import 'package:flutter/material.dart';

class HomeModel {
  String homeImage;
  String homeTemperature;
  int userAccess;
  bool homeStatus;
  List<DeviceInHome>? devices;
  HomeModel({
    required this.homeImage,
    required this.homeTemperature,
    required this.userAccess,
    this.homeStatus = false,
    this.devices,
  });
}

class DeviceInHome {
  String deviceName;
  IconData iconOn;
  IconData iconOff;
  bool deviceStatus;
  DeviceInHome({
    required this.deviceName,
    required this.iconOn,
    required this.iconOff,
    this.deviceStatus = false,
  });
}

HomeModel smartHome = HomeModel(
    homeImage: "assets/images/living_room.jpg",
    homeTemperature: "27°",
    userAccess: 1,
    homeStatus: true,
    devices: [
      DeviceInHome(
          deviceName: "Main Door",
          iconOn: Icons.lock_outline,
          iconOff: Icons.lock_open_outlined,
          deviceStatus: true),
      DeviceInHome(
          deviceName: "Second Door",
          iconOn: Icons.lock_outline,
          iconOff: Icons.lock_open_outlined,
          deviceStatus: true),
    ]);

// List<HomeModel> smartHomeData = [
//   HomeModel(
//     roomTemperature: "25°",
//     userAccess: 4,
//     homeStatus: true,
//     devices: [
//       DeviceInHome(
//         deviceName: "WiFi",
//         iconOn: Icons.wifi,
//         iconOff: Icons.wifi_off,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Light",
//         iconOn: Icons.lightbulb_rounded,
//         iconOff: Icons.lightbulb_outline_rounded,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Fan",
//         iconOn: Icons.air,
//         iconOff: Icons.mode_fan_off_outlined,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "TV",
//         iconOn: Icons.tv,
//         iconOff: Icons.tv_off,
//         deviceStatus: false,
//       ),
//       DeviceInHome(
//         deviceName: "AC",
//         iconOn: Icons.ac_unit,
//         iconOff: Icons.thermostat,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Home Theater",
//         iconOn: Icons.speaker_outlined,
//         iconOff: Icons.volume_off_outlined,
//         deviceStatus: false,
//       ),
//     ],
//   ),
//   HomeModel(
//     roomTemperature: "25°",
//     userAccess: 1,
//     homeStatus: true,
//     devices: [
//       DeviceInHome(
//         deviceName: "WiFi",
//         iconOn: Icons.wifi,
//         iconOff: Icons.wifi_off,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Light",
//         iconOn: Icons.lightbulb_rounded,
//         iconOff: Icons.lightbulb_outline_rounded,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Fan",
//         iconOn: Icons.air,
//         iconOff: Icons.mode_fan_off_outlined,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "TV",
//         iconOn: Icons.tv,
//         iconOff: Icons.tv_off,
//         deviceStatus: false,
//       ),
//       DeviceInHome(
//         deviceName: "Home Theater",
//         iconOn: Icons.speaker_outlined,
//         iconOff: Icons.volume_off_outlined,
//         deviceStatus: false,
//       ),
//       DeviceInHome(
//         deviceName: "AC",
//         iconOn: Icons.ac_unit,
//         iconOff: Icons.thermostat,
//         deviceStatus: true,
//       ),
//     ],
//   ),
//   HomeModel(
//     roomTemperature: "25°",
//     userAccess: 4,
//     homeStatus: true,
//     devices: [
//       DeviceInHome(
//         deviceName: "WiFi",
//         iconOn: Icons.wifi,
//         iconOff: Icons.wifi_off,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Light",
//         iconOn: Icons.lightbulb_rounded,
//         iconOff: Icons.lightbulb_outline_rounded,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Fan",
//         iconOn: Icons.air,
//         iconOff: Icons.mode_fan_off_outlined,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "AC",
//         iconOn: Icons.ac_unit,
//         iconOff: Icons.thermostat,
//         deviceStatus: true,
//       ),
//     ],
//   ),
//   HomeModel(
//     roomTemperature: "25°",
//     userAccess: 2,
//     homeStatus: true,
//     devices: [
//       DeviceInHome(
//         deviceName: "WiFi",
//         iconOn: Icons.wifi,
//         iconOff: Icons.wifi_off,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Light",
//         iconOn: Icons.lightbulb_rounded,
//         iconOff: Icons.lightbulb_outline_rounded,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Chimney",
//         iconOn: Icons.air,
//         iconOff: Icons.power_off_outlined,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Fridge",
//         iconOn: Icons.kitchen,
//         iconOff: Icons.power_off_outlined,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Microwave",
//         iconOn: Icons.microwave,
//         iconOff: Icons.power_off_outlined,
//         deviceStatus: false,
//       ),
//       DeviceInHome(
//         deviceName: "Grinder",
//         iconOn: Icons.power,
//         iconOff: Icons.power_off_outlined,
//         deviceStatus: false,
//       ),
//       DeviceInHome(
//         deviceName: "Induction",
//         iconOn: Icons.power,
//         iconOff: Icons.power_off_outlined,
//         deviceStatus: false,
//       ),
//       DeviceInHome(
//         deviceName: "Coffee Maker",
//         iconOn: Icons.coffee_maker_outlined,
//         iconOff: Icons.power_off_outlined,
//         deviceStatus: false,
//       ),
//       DeviceInHome(
//         deviceName: "AC",
//         iconOn: Icons.ac_unit,
//         iconOff: Icons.thermostat,
//         deviceStatus: true,
//       ),
//     ],
//   ),
//   HomeModel(
//     roomTemperature: "25°",
//     userAccess: 2,
//     homeStatus: true,
//     devices: [
//       DeviceInHome(
//         deviceName: "WiFi",
//         iconOn: Icons.wifi,
//         iconOff: Icons.wifi_off,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Light",
//         iconOn: Icons.lightbulb_rounded,
//         iconOff: Icons.lightbulb_outline_rounded,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Fan",
//         iconOn: Icons.air,
//         iconOff: Icons.mode_fan_off_outlined,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "AC",
//         iconOn: Icons.ac_unit,
//         iconOff: Icons.thermostat,
//         deviceStatus: true,
//       ),
//     ],
//   ),
//   HomeModel(
//     roomTemperature: "25°",
//     userAccess: 1,
//     homeStatus: true,
//     devices: [
//       DeviceInHome(
//         deviceName: "WiFi",
//         iconOn: Icons.wifi,
//         iconOff: Icons.wifi_off,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Light",
//         iconOn: Icons.lightbulb_rounded,
//         iconOff: Icons.lightbulb_outline_rounded,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Fan",
//         iconOn: Icons.air,
//         iconOff: Icons.mode_fan_off_outlined,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "AC",
//         iconOn: Icons.ac_unit,
//         iconOff: Icons.thermostat,
//         deviceStatus: true,
//       ),
//     ],
//   ),
//   HomeModel(
//     roomTemperature: "25°",
//     userAccess: 1,
//     homeStatus: true,
//     devices: [
//       DeviceInHome(
//         deviceName: "Light",
//         iconOn: Icons.lightbulb_rounded,
//         iconOff: Icons.lightbulb_outline_rounded,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Fan",
//         iconOn: Icons.air,
//         iconOff: Icons.mode_fan_off_outlined,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "TV",
//         iconOn: Icons.tv,
//         iconOff: Icons.tv_off,
//         deviceStatus: false,
//       ),
//       DeviceInHome(
//         deviceName: "AC",
//         iconOn: Icons.ac_unit,
//         iconOff: Icons.thermostat,
//         deviceStatus: true,
//       ),
//     ],
//   ),
//   HomeModel(
//     roomTemperature: "25°",
//     userAccess: 1,
//     homeStatus: true,
//     devices: [
//       DeviceInHome(
//         deviceName: "Light",
//         iconOn: Icons.lightbulb_rounded,
//         iconOff: Icons.lightbulb_outline_rounded,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Fan",
//         iconOn: Icons.air,
//         iconOff: Icons.mode_fan_off_outlined,
//         deviceStatus: true,
//       ),
//     ],
//   ),
//   HomeModel(
//     roomTemperature: "25°",
//     userAccess: 4,
//     homeStatus: true,
//     devices: [
//       DeviceInHome(
//         deviceName: "WiFi",
//         iconOn: Icons.wifi,
//         iconOff: Icons.wifi_off,
//         deviceStatus: false,
//       ),
//       DeviceInHome(
//         deviceName: "Light",
//         iconOn: Icons.lightbulb_rounded,
//         iconOff: Icons.lightbulb_outline_rounded,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Water Pump",
//         iconOn: Icons.water_drop,
//         iconOff: Icons.power_off_outlined,
//         deviceStatus: false,
//       ),
//       DeviceInHome(
//         deviceName: "Washing Machine",
//         iconOn: Icons.local_laundry_service,
//         iconOff: Icons.power_off_outlined,
//         deviceStatus: false,
//       ),
//     ],
//   ),
//   HomeModel(
//     roomTemperature: "25°",
//     userAccess: 3,
//     homeStatus: true,
//     devices: [
//       DeviceInHome(
//         deviceName: "Light",
//         iconOn: Icons.lightbulb_rounded,
//         iconOff: Icons.lightbulb_outline_rounded,
//         deviceStatus: true,
//       ),
//       DeviceInHome(
//         deviceName: "Geysers",
//         iconOn: Icons.water_drop,
//         iconOff: Icons.power_off_outlined,
//         deviceStatus: false,
//       ),
//     ],
//   ),
// ];
