import 'package:flutter/material.dart';
Map<int, Color> color = {
  50: Color.fromRGBO(255, 92, 87, .1),
  100: Color.fromRGBO(255, 92, 87, .2),
  200: Color.fromRGBO(255, 92, 87, .3),
  300: Color.fromRGBO(255, 92, 87, .4),
  400: Color.fromRGBO(255, 92, 87, .5),
  500: Color.fromRGBO(255, 92, 87, .6),
  600: Color.fromRGBO(255, 92, 87, .7),
  700: Color.fromRGBO(255, 92, 87, .8),
  800: Color.fromRGBO(255, 92, 87, .9),
  900: Color.fromRGBO(255, 92, 87, 1),
};
MaterialColor colorpurble = MaterialColor(0xFF460246, color);

MaterialColor colorpurbleAlpha = MaterialColor(0xFF2C880688, color);

ThemeData mythemeData =ThemeData(
    primarySwatch: colorpurble,
//  primarySwatch: Colors.purple,
//    color: Color.hex("#183451"),
//    Color.fromARGB(255,68,44,104)
  accentColor:colorpurble,
  backgroundColor: colorpurbleAlpha,


  fontFamily: 'CourierPrime'


);
TextTheme  textTheme=TextTheme(
headline: TextStyle(fontSize: 52.0, fontWeight: FontWeight.bold),
title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
body1: TextStyle(fontSize: 20.0,color: Colors.white),

);
