import 'package:flutter/material.dart';


import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:menu_flutter/BL/UserMethod.dart';
import 'package:menu_flutter/Models/myNotification.dart';
class Notification_lical extends StatefulWidget {
  @override
  _Notification_licalState createState() => _Notification_licalState();
}

class _Notification_licalState extends State<Notification_lical> {


  List notificaList= new List();

//  void refreshScreen() {
//    notificaList.clear();
//
//    setState(() {
//      notificaList=myNotification.getListNotification();
//
//    });
//
//    print("notificaList.length=");
//
//    print(notificaList.length);
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/purple_background.jpg"),
              fit: BoxFit.cover),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            getTitle(),
            getPointsDetailList(),
//          RaisedButton(textColor: Colors.purple,child: Text("show Notification"),
//          onPressed: showNotification,)
          ],
        ),
      ),
    );
  }

 Widget getTitle() {
   return new  SizedBox(
     child: Padding(
       padding: const EdgeInsets.only(top: 80,right: 10,left: 10),
       child: Opacity(
         child: Container(
             decoration: BoxDecoration (
               color:  Colors.white,
               borderRadius: BorderRadius.circular(20),
//              border: Border.all(color: Color(0xFF460246),width: 1,style: BorderStyle.solid),

             ),
             child: Column(
               children: <Widget>[
                 Align(
                     alignment: Alignment.center,

                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Text("Point App",style: TextStyle(fontSize: 25,color: Color(0xFF460246),),),
                     )),

                 myDivider(),

                 Align(
                     alignment: Alignment.center,

                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Text("Notification",style: TextStyle(fontSize: 25,color:Color(0x8A5C075C),),),
                     )),





               ],
             ),
             width:MediaQuery.of(context).size.width,
             height:MediaQuery.of(context).size.height/7
         ),
         opacity: 0.8,),
     ),
   );

 }
    Widget myDivider() {
      return
        Divider(
          thickness: 5,
          height: 20,
          endIndent: 20,
          indent: 20,
          color:Color(0xFF460246),
        );
    }


  void refreshScreen() {
    notificaList.clear();
    UserMethod.getAllNotification()
        .then((vals) {



      setState(() {
          vals.forEach((val) {
            notificaList.add(val);
          });


      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    barcodeDialog(context);
    refreshScreen();

  }
  Widget getPointsDetailList() {
//    refreshScreen();
    return new  SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 20,right: 10,left: 10),
        child: Opacity(
          child: Container(
            decoration: BoxDecoration (
              color:  Colors.white,
              borderRadius: BorderRadius.circular(20),


            ),
            child:   fillpointsDetailList(),

            width:MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height/1.4,
          ),
          opacity: 0.8,),
      ),
    );


  }
  Widget fillpointsDetailList() {
    return new Container(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(itemCount: notificaList.length,itemBuilder: (BuildContext context,int position,){
              return
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: fillPointDetailList(context,position),
                );

            }),
          )
        ],
      ),
      width: 500,      height: 250,

    );
  }
  Widget fillPointDetailList(BuildContext context, int position) {
    return new Card(

      child: Container(
        decoration: BoxDecoration (
          color:  Color(0xFF460246),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              blurRadius: 5.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow
              offset: Offset(
                2.0, // horizontal, move right 10
                2.0, // vertical, move down 10
              ),
            )
          ],
//              border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),

        ),
        child:
          Wrap (children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 3,bottom: 3,right: 8,left: 10),
                      child: Text( notificaList[position]["POINT_FOR_NOTIFICATION"],style: TextStyle(fontSize: 20,color: Colors.white)),
                    ),
                    Text("Points",style:TextStyle(fontSize: 20,color: Colors.white)),

                  ],
                ),
                Wrap(
                  children: <Widget>[ Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(

                        child: Padding(
                          padding: const EdgeInsets.only(top: 3,bottom: 3,right: 8,left: 10),
                        child:    Text( notificaList[position]["DESCRIPTION2"],style: TextStyle(fontSize: 20,color: Colors.white)),


                        ),
                      ),

                    ],
                  ),],

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 3,bottom: 3,right: 8,left: 10),
                      child: Text(notificaList[position]["DATE_FOR_NOTIFICATION2"],style:TextStyle(fontSize: 20,color: Colors.white)),

                    ),
                    Text(notificaList[position]["TIME_FOR_NOTIFICATION"],style:TextStyle(fontSize: 20,color: Colors.white)),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 3,bottom: 3,right: 8,left: 10),
                      child: Text("Expiry Date : ",style: TextStyle(fontSize: 20,color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3,bottom: 3,right: 8,left: 10),
                      child: Text( notificaList[position]["DATE_FOR_NOTIFICATION2"],style: TextStyle(fontSize: 20,color: Colors.white)),
                    ),

                  ],
                ),
              ],
            ),
          ],)

      ),

    );





  }
}



