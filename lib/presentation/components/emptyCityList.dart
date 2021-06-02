import 'package:flutter/material.dart';

Widget emptyCityList(color,String text,icon){
  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Column(
                children: [
                  Icon(
                      icon,
                      size: 240,
                      color: color
                  ),
                  Text(
                      text,
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 28
                      )
                  )
                ],
              )
          ),
        ],
      )
  );
}