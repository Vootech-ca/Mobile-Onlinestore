import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/VooHttp.dart';
import 'package:mobile_onlinestore/Models/CategoryModel.dart';

class CategoryProvider extends ChangeNotifier {
  static const String HOST_URL = "http://www.mamostakanm.com/dev/public/api/";
  final String getAllCategoriesURL = "${HOST_URL}categories/all/ ";
  final String getSingleCategoryURL = "${HOST_URL}categories/show/";

  List<dynamic> categoriesList = [];
  List<dynamic> searchedCategoriesList = [];

  Future<void> getAllSkins() async {
    var response = await getHTTP(url: getAllCategoriesURL, headers: {});
    // ignore: unnecessary_null_comparison
    if (response == null) {
      print("RESPONSE IS NULL");
    }
    // print(response);
    categoriesList =
        response["result"].map((data) => Category.fromJson(data)).toList();
    searchedCategoriesList = categoriesList;
    notifyListeners();
  }

  Category getSkinByLocalId(String id) {
    Category category =
        categoriesList.firstWhere((element) => element.id == id);
    return category;
  }

  Future<Category> getSkinByGlobalId(String id) async {
    var response = await getHTTP(url: getSingleCategoryURL + id, headers: {});
    // ignore: unnecessary_null_comparison
    if (response == null) {
      print("RESPONSE IS NULL");
    }
    // print(response);
    List<Category> list =
        response["result"].map((data) => Category.fromJson(data)).toList();

    return list.first;
  }

  void searchForSlinkShots({required String text}) {
    if (text == "" || searchedCategoriesList.isEmpty) {
      searchedCategoriesList = categoriesList;
      notifyListeners();
    } else {
      var list = searchedCategoriesList.where((b) {
        return b.name.contains(text);
      }).toList();

      if (list.isEmpty) {
        searchedCategoriesList = categoriesList;
        notifyListeners();
      } else {
        searchedCategoriesList = list;
        notifyListeners();
      }
    }
    notifyListeners();
  }
}
