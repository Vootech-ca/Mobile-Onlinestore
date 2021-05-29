import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Theme.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/Models/ItemModel.dart';
import 'package:mobile_onlinestore/StateManagement/CartProvider.dart';
import 'package:mobile_onlinestore/dummyData.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String routeCartScreen = '/cart';

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (_, cartState, __) => Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  Text(
                    'Items In Your Cart :',
                    style: textTheme(context).headline5,
                  ),
                  SizedBox(height: 20),
                  cartState.cartList.isNotEmpty
                      ? Column(
                          children: cartState.cartList
                              .map((e) => makeACartCard(context, e))
                              .toList(),
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => cartState.makeCartEmpty(),
                          child: Container(
                            decoration: BoxDecoration(
                                color: theme(context).accentColor,
                                borderRadius: BorderRadius.circular(7)),
                            child: Row(
                              children: [
                                Text(
                                  'Make Cart Empty',
                                  style: theme(context)
                                      .textTheme
                                      .button!
                                      .copyWith(
                                          color: theme(context).errorColor),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.delete_sweep,
                                  color: theme(context).errorColor,
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
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
                        showWarningDialog(context);
                      },
                      child: Text('Check Out '),
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
                      onPressed: () {},
                      child: Text('Issues in price ? Contact !'),
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

  Widget makeACartCard(BuildContext context, Item item) {
    return Stack(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10, right: 8),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: theme(context).accentColor,
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                      size: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: theme(context).accentColor,
                    child: Icon(
                      Icons.arrow_downward,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              // height: 40,
              width: MediaQuery.of(context).size.width - 80,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      6,
                    ),
                    child: Image.network(
                      fruitImageDummy,
                      height: 60,
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.itemTitle,
                        style: textTheme(context).headline5,
                      ),
                      SizedBox(height: 2),
                      Text("122 Items"),
                      Text(" ${item.itemPrice}\$ for each Item")
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 16,
            right: 20,
            child: IconButton(
              onPressed: () => Provider.of<CartProvider>(context, listen: false)
                  .removeToCart(item),
              icon: Icon(
                Icons.delete_rounded,
                color: theme(context).errorColor,
              ),
            ))
      ],
    );
  }

  showWarningDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Sorry !'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('It is not available right now !'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: theme(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ],
                  )
                ],
              ));
        });
  }
}
