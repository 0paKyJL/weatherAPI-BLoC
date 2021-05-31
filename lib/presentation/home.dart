import 'package:clear_architecture/domain/state/homeState.dart';
import 'package:clear_architecture/internal/dependencies/homeModule.dart';
import 'package:clear_architecture/presentation/settings.dart';
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
  var kelvin = 273;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFFCDDC39),
          title: Text(
              'Weather',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              )
          ),

        ),
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
            SizedBox(height:25),
            ElevatedButton(
              child: Text('Получить',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              onPressed: _getDay,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFCDDC39)),
              ),
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
            autofocus: true,
            autocorrect: true,
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: InputDecoration(hintText: 'Введите город, например: Moscow'),
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
        return Container(
          height: MediaQuery.of(context).size.height*0.1,
          width: double.infinity,
          color: Color(0xFFCDDC39),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Город: ${_homeState.data.city}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black)
              ),
              Text(
                  'Ощущается как : ${(_homeState.data.feelsTemperature-kelvin).toStringAsFixed(1)} C'
                  ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black)
              ),
              Text(
                  'Температура: ${(_homeState.data.temperature-kelvin).toStringAsFixed(1)} C',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  )
              ),
            ],
          ),
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