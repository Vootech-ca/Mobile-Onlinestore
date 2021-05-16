import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/UI/Screens/HomeScreen/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const routeSplashScreen = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      // Do Something Before it Goes to Home Screen
      Navigator.pushNamed(context, HomeScreen.routeHomeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme(context).backgroundColor,
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: theme(context).backgroundColor,
          valueColor:
              new AlwaysStoppedAnimation<Color>(theme(context).errorColor),
        ),
      ),
    );
  }
}
