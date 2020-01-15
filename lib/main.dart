import 'package:flutter/material.dart';
import 'package:menu_flutter/screens/home_screen.dart';
import 'package:menu_flutter/screens/registrationCustomer.dart';
import 'package:menu_flutter/screens/second_screen.dart';
import 'package:menu_flutter/screens/third_screen.dart';
import 'package:menu_flutter/utils/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(



      theme:mythemeData ,
//      home: Home_Screen(),
    routes: {
        '/':(context)=> Home_Screen(),
      '/second':(context)=> Second_Screen(),
      '/third':(context)=> Third_Screen(),
      '/registerCust':(context)=>registrationCustomer(),

    },
    );
  }

  showBarcodeDialog() {

  }

}
