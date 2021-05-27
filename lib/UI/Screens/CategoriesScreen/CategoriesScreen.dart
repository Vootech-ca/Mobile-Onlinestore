import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Responsive.dart';
import 'package:mobile_onlinestore/StateManagement/CategoryProvider.dart';
import 'package:mobile_onlinestore/UI/Components/ProductCart.dart';
import 'package:mobile_onlinestore/dummyData.dart';
import 'package:provider/provider.dart';
import 'package:simple_grid/simple_grid.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeCategoriesScreen = '/categories';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
        builder: (_, catState, __) => DefaultTabController(
              length:  catState.categoriesList.length,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Categories'),
                  bottom: TabBar(
                    controller: TabController(
                        length: catState.categoriesList.length,
                        initialIndex: 0,
                        vsync: this),
                    isScrollable: true,
                    tabs: catState.categoriesList
                        .map<Tab>((e) => Tab(
                              text: e.categoryName,
                            ))
                        .toList(),
                  ),
                ),
                body: TabBarView(
                  children: catState.categoriesList
                      .map(
                        (e) => Padding(
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
                        ),
                      )
                      .toList(),
                ),
              ),
            ));
  }
}
