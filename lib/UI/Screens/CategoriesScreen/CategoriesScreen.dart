import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Language.dart';
import 'package:mobile_onlinestore/Helper/Responsive.dart';
import 'package:mobile_onlinestore/StateManagement/CategoryProvider.dart';
import 'package:mobile_onlinestore/StateManagement/ItemProvider.dart';
import 'package:mobile_onlinestore/UI/Components/ProductCart.dart';
import 'package:provider/provider.dart';
import 'package:simple_grid/simple_grid.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeCategoriesScreen = '/categories';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    final words = Provider.of<Language>(context).getWords;
    return Consumer<CategoryProvider>(builder: (_, catState, __) {
      controller = TabController(
          length: catState.categoriesList.length, initialIndex: 0, vsync: this);
      return DefaultTabController(
        length: catState.categoriesList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(words['categories']),
            bottom: TabBar(
              controller: controller,
              isScrollable: true,
              onTap: (index) {
                Provider.of<ItemProvider>(context, listen: false)
                    .getItemsListByCatId(
                        catState.categoriesList[index].id.toString());
              },
              tabs: catState.categoriesList
                  .map<Tab>((e) => Tab(
                        text: e.categoryName,
                      ))
                  .toList(),
            ),
          ),
          body: Consumer<ItemProvider>(
            builder: (_, itemState, __) => TabBarView(
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
                          children: itemState.currentItemsList
                              .map((e) => ProductCard(context, e))
                              .toList(),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
    });
  }
}
