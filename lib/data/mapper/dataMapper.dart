

import 'package:clear_architecture/data/api/model/apiData.dart';
import 'package:clear_architecture/domain/model/weather.dart';

class DataMapper{
  static Data fromApi(ApiData data){
print(data);
    try{
      return Data(
    city: data.city,
    description: data.description,
    temperature: data.temperature);
    }
    on Exception catch(e){
        print('Error');
    }
  }
}