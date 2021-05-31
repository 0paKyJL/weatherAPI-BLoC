// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeState.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeState on HomeStateBase, Store {
  final _$dataAtom = Atom(name: 'HomeStateBase.data');

  @override
  Data get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(Data value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'HomeStateBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getDayAsyncAction = AsyncAction('HomeStateBase.getData');

  @override
  Future<void> getData({@required String city}) {
    return _$getDayAsyncAction.run(() => super.getData(city: city));
  }

  @override
  String toString() {
    return '''
data: ${data},
isLoading: ${isLoading}
    ''';
  }
}
