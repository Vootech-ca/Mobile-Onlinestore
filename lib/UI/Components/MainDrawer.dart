import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/UI/Screens/CategoriesScreen/CategoriesScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: ()=>Navigator.pushNamed(context, CategoriesScreen.routeCategoriesScreen),
              title:
              Text("Categories", style: theme(context).textTheme.button),
              leading: Icon(Icons.category_outlined),
            ),
            ListTile(
              title:
                  Text("Change Mode", style: theme(context).textTheme.button),
              leading: Icon(Icons.color_lens_outlined),
            ),
            ListTile(
              title: Text("Change Language",
                  style: theme(context).textTheme.button),
              leading: Icon(Icons.language),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 2),
              child: Row(
                children: [
                  Text('©2021 '),
                  Text('vootech')
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),

          ],
        ),
      ),
    );
  }
}
