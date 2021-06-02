import 'package:clear_architecture/internal/application.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

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
        appBar: AppBar(
          title: Text(
            title,
              style: TextStyle(
                  color:Color(0xFFCDDC39),
                  fontSize: 23.0
          )
          ),
          backgroundColor: Colors.black,
        ),
        body:Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(left:10.0,right: 10.0,bottom: 10.0,top: 10),
                child: TextField(
                  controller: textFieldController,
                  keyboardType: TextInputType.name,
                  onEditingComplete: (){
                    setState(() {
                      items.insert(0,textFieldController.text);
                      textFieldController.clear();
                    });
                  },
                ),
              ),
              items.isEmpty
                ? Padding(
                  padding: EdgeInsets.only(top: 10.0),
              child:Container(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Column(
                        children: [
                          Icon(
                              Icons.add,
                              size: 240,
                              color: Color(0xFFCDDC39)
                          ),
                          Text(
                              'Add new items',
                              style: TextStyle(
                                  color: Color(0xFFCDDC39),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28
                              )
                          )
                        ],
                      )
                  ),
                ],
              )
    ))
                : Padding(
                  padding: EdgeInsets.only(top: 65.0),
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: ListTile(
                            title: Text('${items[index]}'),
                            tileColor: Color(0xFFCDDC39),
                            onTap: (){
                              setState(() {
                                context.read<City>().city = items[index];
                                Navigator.pushNamed(context, '/main');
                              });
                            }
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ]
        )

      );
  }
}