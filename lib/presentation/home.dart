import 'package:clear_architecture/domain/state/homeState.dart';
import 'package:clear_architecture/internal/dependencies/homeModule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _cityController = TextEditingController();

  HomeState _homeState;

  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getRowInput(),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Получить'),
              onPressed: _getDay,
            ),
            SizedBox(height: 20),
            _getDayInfo(),
          ],
        ),
      ),
    );
  }

  Widget _getRowInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _cityController,
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: InputDecoration(hintText: 'Широта'),
          ),
        ),
      ],
    );
  }

  Widget _getDayInfo() {
    return Observer(
      builder: (_) {
        if (_homeState.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (_homeState.data == null) return Container();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Город: ${_homeState.data.city}'),
            Text('Описание: ${_homeState.data.description}'),
            Text('Температура: ${_homeState.data.temperature}'),
          ],
        );
      },
    );
  }

  void _getDay() {
    // здесь получаем данные
    final city = _cityController.text;
    _homeState.getData(city: city);
  }
}