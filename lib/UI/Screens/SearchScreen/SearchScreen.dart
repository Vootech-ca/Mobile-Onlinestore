import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Language.dart';
import 'package:mobile_onlinestore/Helper/Responsive.dart';
import 'package:mobile_onlinestore/Helper/Theme.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/StateManagement/ItemProvider.dart';
import 'package:mobile_onlinestore/UI/Components/ProductCart.dart';
import 'package:mobile_onlinestore/UI/Screens/SearchScreen/Components/Filter.dart';
import 'package:provider/provider.dart';
import 'package:simple_grid/simple_grid.dart';

class SearchScreen extends StatelessWidget {
  static const String routeSearchScreen = '/search';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ItemProvider>(context, listen: true);
    final words = Provider.of<Language>(context).getWords;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Filter(),
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          onChanged: (text) {
            prov.searchForItems(text: text);
          },
          decoration: InputDecoration(
            hintText: words['search'],
            hintStyle: textTheme(context).subtitle2,
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.zero,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppTheme.black.withOpacity(0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppTheme.black.withOpacity(0.2)),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
            icon: Icon(Icons.filter_alt_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5),
          child: SpGrid(
            width: Responsive.sW(context),
            spacing: 15,
            runSpacing: 15,
            children: prov.searchedItemsList
                .map((e) => ProductCard(context, e))
                .toList(),
          ),
        ),
      ),
    );
  }
}
