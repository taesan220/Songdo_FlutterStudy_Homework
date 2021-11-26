import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomDialog {
  static showOneButtonDialog(
      BuildContext context, String title, String message, String buttonTitle) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Center(child: new Text(title)),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog

            Container(
              height: 1,
              color: Colors.grey[200],
            ),

            new FlatButton(
              child: new Text(
                buttonTitle,
                style: TextStyle(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
