import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Language.dart';
import 'ThemeOf.dart';

class Dialogs{

  static showSuccessDialog(BuildContext context) {
    final words = Provider.of<Language>(context,listen: false).getWords;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text(words['success']),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${words['order']}  ${words['success']}'),
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
                        child: Text(words['close']),
                      ),
                    ],
                  )
                ],
              ));
        });
  }

  static showWarningDialog(BuildContext context) {
    final words = Provider.of<Language>(context,listen: false).getWords;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text(words['sorry']),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(words['not available']),
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
                        child: Text(words["close"]),
                      ),
                    ],
                  )
                ],
              ));
        });
  }

}