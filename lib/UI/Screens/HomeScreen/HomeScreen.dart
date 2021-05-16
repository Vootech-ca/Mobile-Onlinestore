import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';

class HomeScreen extends StatelessWidget {
  static const routeHomeScreen = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: theme(context).textTheme.headline5,
        ),
        leading: SizedBox.shrink(),
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
