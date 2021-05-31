import 'package:clear_architecture/data/repository/apiModule.dart';
import 'package:clear_architecture/data/repository/weatherDataRepository.dart';
import 'package:clear_architecture/domain/repository/dataRepository.dart';

class RepositoryModule {
  static DataRepository _dataRepository;

  static DataRepository dataRepository() {
    if (_dataRepository == null) {
      _dataRepository = WeatherDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _dataRepository;
  }
}