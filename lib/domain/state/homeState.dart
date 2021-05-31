import 'package:clear_architecture/domain/model/weather.dart';
import 'package:clear_architecture/domain/repository/dataRepository.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

part 'homeState.g.dart';


class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._dataRepository);

  final DataRepository _dataRepository;

  @observable
  Data data;

  @observable
  bool isLoading = false;

  @action
  Future<void> getData({
    @required String city,
  }) async {
    isLoading = true;
    final dbData = await _dataRepository.getData(city: city);
    data = dbData;
    isLoading = false;
  }
}