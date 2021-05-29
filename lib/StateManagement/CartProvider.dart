import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/VooHttp.dart';
import 'package:mobile_onlinestore/Models/CategoryModel.dart';
import 'package:mobile_onlinestore/Models/ItemModel.dart';

class CartProvider extends ChangeNotifier {

  List<dynamic> cartList = [];

  void addToCart(Item item)  {
     cartList.add(item);
    notifyListeners();
  }

  void removeToCart(Item item)  {
    cartList.remove(item);
    notifyListeners();
  }

  void makeCartEmpty(){
    cartList.clear();
    notifyListeners();
  }

}
