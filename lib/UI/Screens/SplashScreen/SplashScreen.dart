import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Constants.dart';
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
    Future.delayed(const Duration(milliseconds: 1300), () {
      // Do Something Before it Goes to Home Screen
      Navigator.pushNamed(context, HomeScreen.routeHomeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox.shrink(),
          Center(
            child: Image.asset(Constants.logo, scale: 4),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SPONSERED BY",
                    style: theme(context).textTheme.button,
                  ),
                  Text(
                    "VOO TECH",
                    style: theme(context).textTheme.headline1!.copyWith(fontSize: 18),
                  ),
                  // Image.asset(Constants.logoVooTech, scale: 6)
                ],
              ))
        ],
      ),
    );
  }
}
