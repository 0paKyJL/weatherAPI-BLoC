import 'package:clear_architecture/domain/model/weather.dart';
import 'package:flutter/material.dart';

abstract class DataRepository{
  Future<Data> getData({@required String city});
}