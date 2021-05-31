import 'package:flutter/cupertino.dart';

class Data{
  final String city;
  final double feelsTemperature;
  final double temperature;

  Data(
      {
        @required this.city,
        @required this.feelsTemperature,
        @required this.temperature
      }
      );
}