import 'package:door_manager/constants.dart';
import 'package:door_manager/models/home.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({super.key, required this.homeData});
  final HomeModel homeData;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        width: size.width * 8,
        height: size.height * 0.5,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: KMainText,
          borderRadius: BorderRadius.circular(size.width * 0.07),
          image: DecorationImage(
              image: AssetImage(homeData.homeImage),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken)),
        ),
        child: Text(
          "Devices in Home",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 161, 96, 191)),
        ),
      ),
    );
  }
}
