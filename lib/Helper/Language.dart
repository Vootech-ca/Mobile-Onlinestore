import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language with ChangeNotifier {
  // language dir
  String languageDirection = 'ltr';
  // language code
  String languageCode = 'en';

  // String languageDirection() => _languageDirection;
  // String languageCode() => _languageCode;

  void setLanguage(code, direction) async {
    languageCode = code;
    languageDirection = direction;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('languageCode', languageCode);
    sharedPreferences.setString('languageDirection', direction);
    notifyListeners();
  }

  Future<void> getLanguageDataInLocal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    languageCode = sharedPreferences.getString('languageCode') ?? languageCode;
    languageDirection =
        sharedPreferences.getString('languageDirection') ?? languageDirection;
    notifyListeners();
  }

  Map<String, dynamic> get getWords => _words[languageCode];

  // language words
  Map<String, dynamic> _words = {
    'kr': {
      'categories': "بابەتەکان",
      'change mode': "گۆڕینی مۆد",
      'change language': "گۆڕینی زمان",
      'cart': "عەرەبانە",
      'item in your cart': 'کاڵاکانی ناو عەرەبانەکەت',
      'items': 'کاڵا',
      'for each item': 'بۆ هەر کاڵایەک',
      'make cart empty': 'عەرەبانەکە بەتاڵ بکە',
      'check out': 'پشکنین',
      'search': 'گەڕان...',
      'price': 'نرخ',
      'category': 'بابەت',
      'add to cart': 'بیخە ناو عەرەبانە',
      'description': 'وەسف'
    },
    'en': {
      'categories': "Categories",
      'change mode': "Change Mode",
      'change language': "Change Language",
      'cart': "Cart",
      'item in your cart': 'Items in your cart',
      'items': 'Items',
      'for each item': 'For each item',
      'make cart empty': 'Make Cart Empty',
      'check out': 'Check Out',
      'search': 'Search',
      'price': 'Price',
      'category': 'Category',
      'add to cart': 'Add To Cart',
      'description': 'Description'
    },
    'ar': {
      'categories': "فئات",
      'change mode': "تغيير الوضع",
      'change language': "تغيير اللغة",
      'cart': "عربة التسوق",
      'item in your cart': 'العناصر الموجودة في سلة التسوق',
      'items': 'العناصر',
      'for each item': 'لكل عنصر',
      'make cart empty': 'جعل العربة فارغة',
      'check out': 'سحب',
      'search': 'بحث',
      'price': 'سعر ',
      'category': 'الفئة',
      'add to cart': 'إضافة إلى العربة',
      'description': 'وصف'
    },
  };
}
