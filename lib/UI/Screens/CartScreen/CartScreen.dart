import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Theme.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/dummyData.dart';

class CartScreen extends StatelessWidget {
  static const String routeCartScreen = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                makeACartCard(context),
                makeACartCard(context),
                makeACartCard(context),
                makeACartCard(context),
                makeACartCard(context),


                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: theme(context).accentColor,
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            Text('Make Cart Empty',style: theme(context).textTheme.button!.copyWith(color: theme(context).errorColor),),
                            SizedBox(width: 4),
                            Icon(Icons.delete_sweep,color: theme(context).errorColor,)
                          ],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
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
                    onPressed: () {},
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
    );
  }

  Widget makeACartCard(BuildContext context){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              CircleAvatar(
                radius: 11,
                backgroundColor: theme(context).accentColor,
                child: Icon(Icons.exposure_plus_1_rounded,color: Colors.green,size: 18,),
              ),
              SizedBox(height: 2),
              CircleAvatar(
                radius: 11,
                backgroundColor: theme(context).accentColor,
                child: Icon(Icons.exposure_minus_1_rounded,color: Colors.red,size: 18,),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 12),
              height: 40,
              width: MediaQuery.of(context).size.width-80,
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
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12,left: 6,),
                  child: Image.network(fruitImageDummy,height: 60,),
                ),
                SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Tomatto',
                          style: textTheme(context).headline6,
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.delete_rounded,color: theme(context).errorColor,)
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                        "122 Items   X   22\$ for each Item"),

                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
