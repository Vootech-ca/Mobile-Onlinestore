import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Language.dart';
import 'package:mobile_onlinestore/StateManagement/CategoryProvider.dart';
import 'package:mobile_onlinestore/StateManagement/ItemProvider.dart';
import 'package:mobile_onlinestore/UI/Screens/CategoriesScreen/CategoriesScreen.dart';
import 'package:mobile_onlinestore/UI/Screens/CategoryScreen/CategoryScreen.dart';
import 'package:mobile_onlinestore/UI/Screens/DetailsScreen/DetailsScreen.dart';
import 'package:mobile_onlinestore/UI/Screens/SearchScreen/SearchScreen.dart';
import 'package:provider/provider.dart';
import 'Helper/Theme.dart';
import 'StateManagement/CartProvider.dart';
import 'UI/Screens/CartScreen/CartScreen.dart';
import 'UI/Screens/HomeScreen/HomeScreen.dart';
import 'UI/Screens/SplashScreen/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //GENERATE PROVIDERS
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<ItemProvider>(
          create: (context) => ItemProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ChangeNotifierProvider<Language>(
          create: (context) => Language(),
        ),
      ],
      child: MaterialApp(
        title: 'Online Store By Voo Tech',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        //GENERATE ROUTES
        initialRoute: SplashScreen.routeSplashScreen,
        builder: (context, child) {
          return Consumer<Language>(
            builder: (_, language, __) => Directionality(
                textDirection: language.languageDirection == 'rtl'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: child!),
          );
        },
        routes: {
          SplashScreen.routeSplashScreen: (context) => SplashScreen(),
          HomeScreen.routeHomeScreen: (context) => HomeScreen(),
          CategoriesScreen.routeCategoriesScreen: (context) =>
              CategoriesScreen(),
          SearchScreen.routeSearchScreen: (context) => SearchScreen(),
          DetailsScreen.routeDetailsScreen: (context) => DetailsScreen(),
          CartScreen.routeCartScreen: (context) => CartScreen(),
          CategoryScreen.categoryScreenRoute: (context) => CategoryScreen(),
        },
      ),
    );
  }
}
