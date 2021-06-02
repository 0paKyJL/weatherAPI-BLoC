import 'package:clear_architecture/presentation/components/appBarWidget.dart';
import 'package:clear_architecture/presentation/components/emptyCityList.dart';
import 'package:clear_architecture/presentation/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class City{
  String city;
}
class InfoScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _InfoScreen();
  }

}
class _InfoScreen extends State<InfoScreen> {
  List<String> items=List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    final title = 'Choose city';
    var textFieldController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white24,
        appBar: getAppBar(title, kPersonalGreen, 23.0),
        body:Stack(
            children: [
              textField(textFieldController, items),
              listCities(),
            ]
        )
      );
  }
  Widget textField(textFieldController,list){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        controller: textFieldController,
        keyboardType: TextInputType.name,
        onEditingComplete: (){
          setState(() {
            list.insert(0,textFieldController.text);
            textFieldController.clear();
          });
        },
      ),
    );
  }
  Widget listCities(){
    Widget retVal;
    items.isEmpty
        ? retVal=Padding(
        padding: EdgeInsets.only(top: 10.0),
        child:emptyCityList(kPersonalGreen, 'Add new items', Icons.add))
        : retVal=Padding(
      padding: EdgeInsets.only(top: 65.0),
      child: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: cityWeather(items[index]),
              );
            },
          )
        ],
      ),
    );
    return retVal;
  }
  Widget cityWeather(String city){
    return ListTile(
        title: Text(
            '$city'.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold
            )
        ),
        tileColor: kPersonalGreen,
        onTap: (){
          setState(() {
            context.read<City>().city = city.toUpperCase();
            Navigator.pushNamed(context, '/main');
          });
        }
    );
  }
}