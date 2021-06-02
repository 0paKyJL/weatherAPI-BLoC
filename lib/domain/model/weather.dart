import 'package:flutter/cupertino.dart';

class Data{
  final String city;
  final String country;
  final String weatherDescription;
  final double feelsTemperature;
  final double temperature;
  final int pressure;

  Data(
      {
        @required this.city,
        @required this.weatherDescription,
        @required this.feelsTemperature,
        @required this.temperature,
        @required this.pressure,
        @required this.country
      }
      );
}