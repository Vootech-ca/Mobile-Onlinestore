import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Dialogs.dart';
import 'package:mobile_onlinestore/Helper/Language.dart';
import 'package:mobile_onlinestore/Helper/Theme.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/Models/ItemModel.dart';
import 'package:mobile_onlinestore/StateManagement/CartProvider.dart';
import 'package:mobile_onlinestore/StateManagement/CategoryProvider.dart';
import 'package:mobile_onlinestore/UI/Screens/CartScreen/CartScreen.dart';
// import 'package:mobile_onlinestore/dummyData.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeDetailsScreen = '/details';

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    var catProv = Provider.of<CategoryProvider>(context, listen: false)
        .getCategoryByLocalId(item.itemCategoryId);
    final words = Provider.of<Language>(context).getWords;
    return Consumer<CartProvider>(
      builder: (_, cartState, __) => Scaffold(
        appBar: AppBar(
          title: Text(item.itemTitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: theme(context).accentColor,
                            borderRadius: BorderRadius.circular(7)),
                        child: Text('${words['price']} ${item.itemPrice}\$'),
                        padding: EdgeInsets.all(10),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Image.network(
                          "http://www.mamostakanm.com/dev/public/items/${item.itemImage}",
                          fit: BoxFit.contain,
                          height: 200,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: theme(context).primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(2, 2),
                          color: AppTheme.black.withOpacity(0.1),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          words['description'],
                          style: textTheme(context).bodyText1,
                        ),
                        SizedBox(height: 10),
                        Text(item.itemDescription),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${words['category']} :',
                        style: textTheme(context).bodyText1,
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: theme(context).accentColor,
                            borderRadius: BorderRadius.circular(7)),
                        child: Text(catProv.categoryName),
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: theme(context).accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return new AlertDialog(
                                  title: new Text('${words['order']} ${item.itemTitle}'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(words['sure order']),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary:
                                                  theme(context).primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                            ),
                                            onPressed: () {
                                              cartState.addToCart(item);
                                              Navigator.pop(context);
                                              Dialogs.showSuccessDialog(
                                                  context);
                                            },
                                            child: Text(words['yes']),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: theme(context)
                                                  .scaffoldBackgroundColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                            ),
                                            onPressed: () {
                                              // cartState.addToCart(item);
                                              Navigator.pop(context);
                                            },
                                            child: Text(words['close']),
                                          ),
                                        ],
                                      )
                                    ],
                                  ));
                            });
                      },
                      child: Text(words['order now']),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: theme(context).scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onPressed: ()=>Navigator.pushNamed(context, CartScreen.routeCartScreen),
                      child: Text(words['go to cart']),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
