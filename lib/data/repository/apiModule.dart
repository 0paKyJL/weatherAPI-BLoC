import 'package:clear_architecture/data/api/apiUtil.dart';
import 'package:clear_architecture/data/api/service/weatherService.dart';

class ApiModule{
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(WeatherService());
    }
    return _apiUtil;
  }
}