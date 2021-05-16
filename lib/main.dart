import 'package:flutter/material.dart';

import 'Helper/Theme.dart';
import 'UI/Screens/HomeScreen/HomeScreen.dart';
import 'UI/Screens/SplashScreen/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Online Store by Voo Tech',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,

        //GENERATE ROUTES
        initialRoute: SplashScreen.routeSplashScreen,
        routes: {
          SplashScreen.routeSplashScreen: (context) => SplashScreen(),
          HomeScreen.routeHomeScreen: (context) => HomeScreen(),
        },
    );
  }
}
