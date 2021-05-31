

import 'package:clear_architecture/data/api/model/apiData.dart';
import 'package:clear_architecture/data/api/request/getDataBody.dart';
import 'package:dio/dio.dart';

class WeatherService{
  static const String APIkey = '837b96e97c05cf6959320af4b3f2d8b1';
  static const String city = 'London';
  static const _BASE_URL='https://api.openweathermap.org/data/2.5';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<ApiData> getData(GetDataBody body)
  async {
    try{
      final response = await _dio.get(
        '/weather',
         queryParameters: {
          'city': city,
           'appid': APIkey,
         },
      );
      return ApiData.fromApi(response.data);
    }
    on Exception catch(e){
      print(e);
    }
  }

}