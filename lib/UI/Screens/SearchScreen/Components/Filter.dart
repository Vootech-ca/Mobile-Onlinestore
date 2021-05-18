import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/dummyData.dart';

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              items: dCategories
                  .map<DropdownMenuItem<dynamic>>((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (dynamic value) {},
            ),
          ),
        ],
      ),
    );
  }
}
