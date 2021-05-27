import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Responsive.dart';
import 'package:mobile_onlinestore/Models/CategoryModel.dart';
import 'package:mobile_onlinestore/StateManagement/CategoryProvider.dart';
import 'package:mobile_onlinestore/StateManagement/ItemProvider.dart';
import 'package:mobile_onlinestore/UI/Components/ProductCart.dart';
import 'package:provider/provider.dart';
import 'package:simple_grid/simple_grid.dart';

class CategoryScreen extends StatelessWidget {
  static const String categoryScreenRoute = '/category';

  @override
  Widget build(BuildContext context) {
    final cat = ModalRoute.of(context)!.settings.arguments as Category;
    // Provider.of<ItemProvider>(context,listen: false).getItemsListByCatId(cat.id.toString());
    return Consumer<ItemProvider>(
      builder: (_, itemState, __) => Scaffold(
        appBar: AppBar(
          title: Text(cat.categoryName),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
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
    );
  }
}
