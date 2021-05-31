import 'package:clear_architecture/data/repository/repositoryModule.dart';
import 'package:clear_architecture/domain/state/homeState.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(
      RepositoryModule.dataRepository(),
    );
  }
}