import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:mobile_onlinestore/Constants.dart';
import 'package:mobile_onlinestore/Helper/Responsive.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/UI/Components/ProductCart.dart';
import 'package:simple_grid/simple_grid.dart';

import '../../../dummyData.dart';

class HomeScreen extends StatelessWidget {
  static const routeHomeScreen = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text(
          //   "Home",
          //   style: theme(context).textTheme.headline5,
          // ),
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              Constants.menu2Icon,
              color: const Color(0xFF454545),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                Constants.searchIcon,
                color: const Color(0xFF454545),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                Constants.cartIcon,
                color: const Color(0xFF454545),
              ),
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
                    slideBuilder: (index) {
                      return Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: adImagesList[index],
                            placeholder: (context, url) =>
                               Image.asset(Constants.placeHolder),
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
              Container(
                height: 220,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          categoryWidget(context),
                          categoryWidget(context),
                          categoryWidget(context),
                          categoryWidget(context),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          categoryWidget(context),
                          categoryWidget(context),
                          categoryWidget(context),
                          categoryWidget(context),
                        ],
                      ),
                    ),
                ],)
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Items",
                  style: theme(context).textTheme.headline5,
                ),
              ),

              SpGrid(
                width: Responsive.sW(context),
                spacing: 15,
                runSpacing: 15,
                children: [
                  ProductCard(context),
                  ProductCard(context),
                  ProductCard(context),
                  ProductCard(context),
                  ProductCard(context),
                  ProductCard(context),
                  ProductCard(context),
                  ProductCard(context),
                ],
              ),

            ],
          ),
        ));
  }

  Widget categoryWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 45, right: 10, left: 10, bottom: 10),
          height: 80,
          width: 190,
          decoration: BoxDecoration(
              color: theme(context).accentColor,
              borderRadius: BorderRadius.circular(18)),
        ),
        Container(
          height: 80,
          width: 170,
          margin: EdgeInsets.all(20),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: fruitsImageDummy,
            placeholder: (context, url) =>Image.asset(Constants.placeHolder),
          ),
        )
      ],
    );
  }
}
