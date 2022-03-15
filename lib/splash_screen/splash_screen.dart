import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pepplo/home_navbar/main_navbar.dart';
import 'package:pepplo/register/register_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return NavbarPage();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
        )
      ),
    );
  }
}
