import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Language.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/UI/Screens/CategoriesScreen/CategoriesScreen.dart';
import 'package:mobile_onlinestore/UI/Screens/SearchScreen/SearchScreen.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<Language>(context);
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(
                  context, CategoriesScreen.routeCategoriesScreen),
              title: Text(language.getWords["categories"],
                  style: theme(context).textTheme.button),
              leading: Icon(Icons.category_outlined),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(
                  context, SearchScreen.routeSearchScreen),
              title: Text(language.getWords["items"],
                  style: theme(context).textTheme.button),
              leading: Icon(Icons.shopping_cart),
            ),
            ListTile(
              title: Text(language.getWords["change mode"],
                  style: theme(context).textTheme.button),
              leading: Icon(Icons.color_lens_outlined),
            ),
            ListTile(
              title: Text(language.getWords["change language"],
                  style: theme(context).textTheme.button),
              leading: Icon(Icons.language),
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        language.getWords['change language'],
                        style: textTheme(context).bodyText2,
                      ),
                      SizedBox(height: 10),
                      TextButton(
                          onPressed: () {
                            language.setLanguage('en', 'ltr');
                            Navigator.pop(context);
                          },
                          child: Text('English')),
                      TextButton(
                          onPressed: () {
                            language.setLanguage('kr', 'rtl');
                            Navigator.pop(context);
                          },
                          child: Text('کوردی')),
                      TextButton(
                          onPressed: () {
                            language.setLanguage('ar', 'rtl');
                            Navigator.pop(context);
                          },
                          child: Text('عربی')),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
              child: Row(
                children: [Text('©2021 '), Text('vootech')],
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
