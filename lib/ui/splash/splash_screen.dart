import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/ui/auth/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash screen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
        body: Image.asset(
      'assets/images/Splash Screen.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ));
  }
}
