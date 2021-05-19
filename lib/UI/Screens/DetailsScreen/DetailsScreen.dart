import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Theme.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/dummyData.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeDetailsScreen = '/details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('D Shirt'),
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
                      child: Text('Price 70\$'),
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
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum is simply dummy text of the printing and typesetting."),
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
                      child: Text('Men'),
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
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
                    onPressed: () {},
                    child: Text('Order Now'),
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
    );
  }
}
