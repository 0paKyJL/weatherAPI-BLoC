import 'package:clear_architecture/data/api/apiUtil.dart';
import 'package:clear_architecture/domain/model/weather.dart';
import 'package:clear_architecture/domain/repository/dataRepository.dart';

class WeatherDataRepository extends DataRepository {
  final ApiUtil _apiUtil;

  WeatherDataRepository(this._apiUtil);

  @override
  Future<Data> getData({String city}) {
    return _apiUtil.getData(city:city);
  }
}