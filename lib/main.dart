import 'package:clear_architecture/presentation/info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'internal/application.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      Provider<City>(create: (_) => City()),
    ],
    child:MaterialApp(
      initialRoute: '/info',
      routes: {
        "/info": (BuildContext context) => InfoScreen(),
        "/main": (BuildContext context) => Application(),
      },
  )));
}