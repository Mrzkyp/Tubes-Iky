import 'package:flutter/material.dart';



///Auth Title
Widget wAuthTitle({String? title , String? subtitle}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title!,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Text(subtitle!),
      ],
    ),
  );
}

///Divider with Text
Widget wTextDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(children: <Widget>[
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text('or Connect With',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              )),
        ),
        Expanded(child: Divider()),
      ]),
    );
  }

