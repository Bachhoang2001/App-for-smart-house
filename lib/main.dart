import 'package:door_manager/models/home.dart';
import 'package:door_manager/pages/home.dart';
import 'package:door_manager/pages/intro.dart';
import 'package:door_manager/constants.dart';
import 'package:door_manager/pages/login_page.dart';
import 'package:door_manager/pages/room_control_screen.dart';
import 'package:door_manager/pages/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const HomeScreen(),
        '/signin': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Door Manager',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          primaryColorLight: kPrimaryLightColor,
          scaffoldBackgroundColor: Colors.white),
      home: Welcome(),
    );
  }
}
