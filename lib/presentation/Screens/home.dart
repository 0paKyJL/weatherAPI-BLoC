import 'package:clear_architecture/domain/state/homeState.dart';
import 'package:clear_architecture/internal/dependencies/homeModule.dart';
import 'package:clear_architecture/presentation/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'info.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeState _homeState;
  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
                Icons.arrow_back_ios,
                color: kPersonalGreen
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
              'Weather',
              style: TextStyle(
                  color: kPersonalGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0
              )
          ),

        ),
        body: Center(
            child: _getBody()
        ),
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
            SizedBox(height: 20),
            _getDataInfo(),
          ],
        ),
      ),
    );
  }

  Widget _getDataInfo() {
    return Observer(
      builder: (_) {
        if (_homeState.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (_homeState.data == null) return Container();
        return infoWeather();
      },
    );
  }

  Widget infoWeather(){
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      width: double.infinity,
      color: kPersonalGreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          infoRow('Страна',_homeState.data.country,''),
          infoRow('Город',_homeState.data.city,''),
          infoRow('Ощущается как',_homeState.data.feelsTemperature,'C'),
          infoRow('Температура',_homeState.data.temperature,'C'),
          infoRow('Давление',_homeState.data.pressure,''),
        ],
      ),
    );
}
Widget infoRow(String nameField,value,measureIndex){
  return Text(
      '$nameField: $value $measureIndex',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black)
  );
}
  void _getData() {
    // здесь получаем данные
    final city = context.read<City>().city;
    _homeState.getData(city: city);
  }
}