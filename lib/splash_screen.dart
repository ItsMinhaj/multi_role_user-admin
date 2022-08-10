import 'dart:async';

import 'package:flutter/material.dart';

import 'package:multi_role/home_page.dart';
import 'package:multi_role/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    isLoggedIn = sp.getBool("isLogin") ?? false;
    if (isLoggedIn) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Homepage()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              "https://images.pexels.com/photos/12977998/pexels-photo-12977998.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")),
    );
  }
}
