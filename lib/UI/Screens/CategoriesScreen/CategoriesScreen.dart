import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Responsive.dart';
import 'package:mobile_onlinestore/UI/Components/ProductCart.dart';
import 'package:simple_grid/simple_grid.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeCategoriesScreen = '/categories';
  final List categories = [
    'Man',
    'Women',
    'Child',
    'Fruits',
    'Accessories',
    'Electronic',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          bottom: TabBar(
            isScrollable: true,
            tabs: categories
                .map<Tab>((e) => Tab(
                      text: e,
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: categories
              .map((e) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(5),
                      child: SpGrid(
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
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
