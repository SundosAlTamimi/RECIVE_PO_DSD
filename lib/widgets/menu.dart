import 'package:flutter/material.dart';

import 'MyMenuItem.dart';
class  MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      child: new Drawer(


        child: Opacity(
          child: Container(


//        height: 100,
//        width: 100,

            color: Theme.of(context).accentColor,
            child: ListView(
              children: <Widget>[


            new DrawerHeader(
            child:
            new Text(""),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/images/nav.jpg'),
                  fit: BoxFit.cover,

                ),
              ),

            ),


//            UserAccountsDrawerHeader(
////              accountName: Text('Tahani ghanoum '),
////              accountEmail: Text("tatataa@gmail.com"),
////              currentAccountPicture: Image.asset('assets/images/purple_background.jpg'),
//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                    fit: BoxFit.fill,
//                      image: Image.asset("assets/images/nav.jpg"))),
//
//            ),
              /*
          ),*/
//            SizedBox(
//              height: 20,
//              width: 20,
//            ),
//              Divider (
//                color: Colors.grey,
//              ),

                MyMenuItem(),
              ],
            ),
          ),
          opacity: 0.9,
        ),
      ),
      opacity: 0.8,
    );
  }
}
