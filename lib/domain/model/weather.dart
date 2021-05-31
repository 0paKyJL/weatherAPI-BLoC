import 'package:flutter/cupertino.dart';

class Data{
  final String city;
  final String description;
  final int temperature;

  Data(
      {
        @required this.city,
        @required this.description,
        @required this.temperature
      }
      );
}