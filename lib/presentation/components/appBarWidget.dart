import 'package:flutter/material.dart';

Widget getAppBar(String title, color,double fontSize){
  return AppBar(
    title: Text(
        title,
        style: TextStyle(
            color:color,
            fontSize: fontSize
        )
    ),
    backgroundColor: Colors.black,
  );
}