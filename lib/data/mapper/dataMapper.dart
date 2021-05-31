

import 'package:clear_architecture/data/api/model/apiData.dart';
import 'package:clear_architecture/domain/model/weather.dart';

class DataMapper{
  static Data fromApi(ApiData data){
print(data);
      return Data(
    city: data.city,
    feelsTemperature: data.feelsTemperature,
    temperature: data.temperature);
  }
}