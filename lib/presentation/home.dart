import 'package:clear_architecture/domain/state/homeState.dart';
import 'package:clear_architecture/internal/dependencies/homeModule.dart';
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
  var kelvin = 273;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Color(0xFFCDDC39)),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
              'Weather',
              style: TextStyle(
                  color: Color(0xFFCDDC39),
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0
              )
          ),

        ),
        body: Center(child: _getBody()),
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
        if (_homeState.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (_homeState.data == null) return Container(
        );
        return Container(
          height: MediaQuery.of(context).size.height*0.1,
          width: double.infinity,
          color: Color(0xFFCDDC39),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Страна: ${_homeState.data.country}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black)
              ),
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
              Text(
                  'Давление: ${(_homeState.data.pressure)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  )
              )
            ],
          ),
        );
      },
    );
  }

  void _getData() {
    // здесь получаем данные
    final city = context.read<City>().city;
    _homeState.getData(city: city);
  }
}