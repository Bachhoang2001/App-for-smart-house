import 'package:door_manager/constants.dart';
import 'package:door_manager/models/home.dart';
import 'package:door_manager/pages/components/glass_morphism.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'components/divice_switch.dart';

class RoomControl extends StatefulWidget {
  const RoomControl({super.key, required this.homeData});
  final HomeModel homeData;

  @override
  State<RoomControl> createState() => _RoomControlState();
}

class _RoomControlState extends State<RoomControl> {
  @override
  Widget build(BuildContext context) {
    final HomeModel homeData = this.widget.homeData;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(homeData.homeImage), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 209, 181, 138)
                              .withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/home");
                        },
                        child: const Icon(
                            color: Colors.white, Icons.arrow_back_ios_new),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomCard(size, smartHome)
          ],
        ),
      ),
    );
  }

  Widget bottomCard2(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.6,
      color: Colors.white.withOpacity(0.5),
    );
  }

  Widget bottomCard(Size size, HomeModel smartHome) {
    return GlassMorphism(
      child: Container(
        width: double.infinity,
        height: size.height * 0.6,
        // color: AppColor.white.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Home",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: FittedBox(
                      child: CupertinoSwitch(
                        value: smartHome.homeStatus,
                        activeColor: Colors.white,
                        trackColor: Colors.black.withOpacity(.3),
                        thumbColor: KMainText,
                        onChanged: (value) {
                          setState(() {
                            smartHome.homeStatus = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "27°",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Divider(
              color: Colors.white.withOpacity(0.5),
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Devices',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              height: size.height * 0.22,
              child: ListView.builder(
                itemCount: smartHome.devices!.length + 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0 || smartHome.devices!.length + 1 == index) {
                    return SizedBox(width: 10);
                  }
                  final data = smartHome.devices![index - 1];
                  return DeviceSwitch(data: data);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
