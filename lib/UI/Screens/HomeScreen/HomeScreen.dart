import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:mobile_onlinestore/Constants.dart';
import 'package:mobile_onlinestore/Helper/Responsive.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/UI/Components/MainDrawer.dart';
import 'package:mobile_onlinestore/UI/Screens/CartScreen/CartScreen.dart';
import 'package:mobile_onlinestore/UI/Screens/CategoryScreen/CategoryScreen.dart';
import 'package:mobile_onlinestore/UI/Screens/SearchScreen/SearchScreen.dart';
import 'package:simple_grid/simple_grid.dart';

import '../../../dummyData.dart';

class HomeScreen extends StatelessWidget {
  static const routeHomeScreen = '/home';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:
        _scaffoldKey,
        drawer: MainDrawer(),
        appBar: AppBar(
          toolbarHeight: 50,
          leading: GestureDetector(
            onTap: () => _scaffoldKey.currentState!.openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                Constants.menu2Icon,
                color: const Color(0xFF454545),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  Constants.searchIcon,
                  color: const Color(0xFF454545),
                ),
              ),
              onTap: () =>
                  Navigator.pushNamed(context, SearchScreen.routeSearchScreen),
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  Constants.cartIcon,
                  color: const Color(0xFF454545),
                ),
              ),
              onTap: () =>
                  Navigator.pushNamed(context, CartScreen.routeCartScreen),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: CarouselSlider.builder(
                    scrollDirection: Axis.horizontal,
                    unlimitedMode: true,
                    slideIndicator: CircularSlideIndicator(
                        padding: EdgeInsets.only(bottom: 20),
                        currentIndicatorColor: theme(context).primaryColor),
                    slideBuilder: (index) {
                      return Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: adImagesList[index],
                              placeholder: (context, url) =>
                                  Image.asset(Constants.placeHolder),
                            ),
                          ));
                    },
                    // slideTransform: CubeTransform(),
                    // slideIndicator: CircularSlideIndicator(
                    //   padding: EdgeInsets.only(bottom: 32),
                    // ),
                    itemCount: adImagesList.length),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Categories",
                  style: theme(context).textTheme.headline5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SpGrid(
                    width: Responsive.sW(context),
                    spacing: 15,
                    runSpacing: 15,
                    children: [
                      categoryWidget(context),
                      categoryWidget(context),
                      categoryWidget(context),
                      categoryWidget(context),
                      categoryWidget(context),
                      categoryWidget(context),
                      categoryWidget(context),
                      categoryWidget(context),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  SpGridItem categoryWidget(BuildContext context) {
    return SpGridItem(
      xs: 4,
      sm: 3,
      md: 3,
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, CategoryScreen.categoryScreenRoute),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                border:
                    Border.all(color: theme(context).primaryColor, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              margin: EdgeInsets.all(4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: fruitsImageDummy,
                  placeholder: (context, url) =>
                      Image.asset(Constants.placeHolder),
                ),
              ),
            ),
            Text(
              'Men',
              style: textTheme(context).bodyText2,
            )
          ],
        ),
      ),
    );
  }
}
