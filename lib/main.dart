import 'package:flutter/material.dart';
import 'screens/HomeWidget.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'PlantManager',

    // routes
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
    },
  ));
}
