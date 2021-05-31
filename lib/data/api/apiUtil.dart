import 'package:clear_architecture/data/api/request/getDataBody.dart';
import 'package:clear_architecture/data/api/service/weatherService.dart';
import 'package:clear_architecture/data/mapper/dataMapper.dart';
import 'package:clear_architecture/domain/model/weather.dart';
import 'package:flutter/cupertino.dart';

class ApiUtil {
  final WeatherService _weatherService;

  ApiUtil(this._weatherService);

  Future<Data> getData({
    @required String city,
  }) async {
    final body = GetDataBody(city:city);
    final result = await _weatherService.getData(body);
    return DataMapper.fromApi(result);
  }
}