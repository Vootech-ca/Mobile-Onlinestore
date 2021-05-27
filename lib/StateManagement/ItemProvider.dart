import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/VooHttp.dart';
import 'package:mobile_onlinestore/Models/CategoryModel.dart';
import 'package:mobile_onlinestore/Models/ItemModel.dart';

class ItemProvider extends ChangeNotifier {
  static const String HOST_URL = "http://www.mamostakanm.com/dev/public/api/";
  final String getAllItemsURL = "${HOST_URL}items/all/";
  final String getSingleItemURL = "${HOST_URL}items/show/";

  List<dynamic> itemsList = [];
  List<dynamic> searchedItemsList = [];

  List<dynamic> currentItemsList = [];

  Future<void> getAllItems() async {
    var response = await getHTTP(url: getAllItemsURL, headers: {});
    // ignore: unnecessary_null_comparison
    if (response == null) {
      print("RESPONSE IS NULL");
    }
    // print(response);
    itemsList = response["result"].map((data) => Item.fromJson(data)).toList();
    searchedItemsList = itemsList;
    currentItemsList = itemsList;
    notifyListeners();
  }

  void getItemsListByCatId(String catId) {
    currentItemsList = itemsList.where((element) => element.itemCategoryId == catId).toList();
    notifyListeners();
  }

  Item getItemByLocalId(String id) {
    Item item = itemsList.firstWhere((element) => element.id == id);
    return item;
  }

  Future<Item> getItemByGlobalId(String id) async {
    var response = await getHTTP(url: getSingleItemURL + id, headers: {});
    // ignore: unnecessary_null_comparison
    if (response == null) {
      print("RESPONSE IS NULL");
    }
    // print(response);
    List<Item> list =
        response["result"].map((data) => Item.fromJson(data)).toList();

    return list.first;
  }

  void searchForItems({required String text}) {
    if (text == "" || searchedItemsList.isEmpty) {
      searchedItemsList = itemsList;
      notifyListeners();
    } else {
      var list = searchedItemsList.where((b) {
        return b.itemTitle.contains(text);
      }).toList();

      if (list.isEmpty) {
        searchedItemsList = itemsList;
        notifyListeners();
      } else {
        searchedItemsList = list;
        notifyListeners();
      }
    }
    notifyListeners();
  }
}
