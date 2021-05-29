import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Theme.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/Models/ItemModel.dart';
import 'package:mobile_onlinestore/StateManagement/CartProvider.dart';
import 'package:mobile_onlinestore/StateManagement/CategoryProvider.dart';
import 'package:mobile_onlinestore/StateManagement/ItemProvider.dart';
import 'package:mobile_onlinestore/dummyData.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeDetailsScreen = '/details';

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    var catProv = Provider.of<CategoryProvider>(context, listen: false)
        .getCategoryByLocalId(item.itemCategoryId);

    return Consumer<CartProvider>(
      builder: (_, cartState, __) => Scaffold(
        appBar: AppBar(
          title: Text('D Shirt'),
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
                        child: Text('Price ${item.itemPrice}\$'),
                        padding: EdgeInsets.all(10),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Image.network(
                          productImageDummy,
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
                          'Description',
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
                        'Category:',
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
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return new AlertDialog(
                                  title: new Text('Order ${item.itemTitle}'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Are you Sure Order this Product ?'),
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
                                              showSuccessDialog(context);
                                            },
                                            child: Text('Yes'),
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
                                            child: Text('Cancel'),
                                          ),
                                        ],
                                      )
                                    ],
                                  ));
                            });
                      },
                      child: Text('Order Now '),
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
                      child: Text('Contact For Details'),
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

  showSuccessDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Success !'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Your order Success'),
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
