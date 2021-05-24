import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Responsive.dart';
import 'package:mobile_onlinestore/UI/Components/ProductCart.dart';
import 'package:simple_grid/simple_grid.dart';

class CategoryScreen extends StatelessWidget {
  static const String categoryScreenRoute = '/category';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Men'),
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
    );
  }
}
