import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/StateManagement/CategoryProvider.dart';
import 'package:provider/provider.dart';

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
        builder: (_, catState, __) => Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Filter'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Selected Category'),
                    trailing: DropdownButton(
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      value: null,
                      hint: Text('Selected'),
                      items: catState.categoriesList
                          .map<DropdownMenuItem<dynamic>>(
                              (e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e.categoryName,
                                  ))
                          .toList(),
                      onChanged: (dynamic value) {},
                    ),
                  ),
                ],
              ),
            ));
  }
}
