import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_flutter/widgets/menu.dart';
import 'dart:math';
class Third_Screen extends StatefulWidget {
  @override
  _Third_ScreenState createState() => _Third_ScreenState();
}

class _Third_ScreenState extends State<Third_Screen> {

  List< String> language=["java","c#","dart","sqlite"];
  double textSize=10;



 String languageText="";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      drawer: MyDrawer(),
//      appBar: AppBar(
//        title: Text(
//            'Third Screen title '
//        ),
//
//      ),
      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
           new InkWell(onTap: changeText,
               child: new Icon(Icons.add,size: 30)
           ),
           new Text(languageText,style: new TextStyle(fontSize: textSize)),
         new RaisedButton( onPressed: changeText,
           child: Text("change Language 2",style: new TextStyle(fontSize: textSize),),
           hoverColor: Colors.amber,
           color: Colors.brown,
           textColor: Colors.cyan,
           elevation: 10,
           colorBrightness: Brightness.light,
           focusColor: Colors.red,
           splashColor: Colors.cyan,
           highlightColor: Colors.amber,
         )
       ],),
      ),
    );
  }
  void changeText(){
    setState(() {
      languageText=language[Random().nextInt(language.length)];
    });
  }
  changetextSize(){
    setState(() {
      textSize++;
    });
  }


}
