import 'package:flutter/material.dart';
import 'package:menu_flutter/BL/UserMethod.dart';

import 'package:menu_flutter/Models/CustomerInformation.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:menu_flutter/utils/theme.dart';
class Second_Screen extends StatefulWidget {
  @override
  _Second_ScreenState createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  final user_controller = new TextEditingController();
  List listCustom=new List();
  TextEditingController txtname=new TextEditingController();
  TextEditingController txtphone=new TextEditingController();

  TextEditingController txtemail=new TextEditingController();

  TextEditingController txtpoint=new TextEditingController();
  TextEditingController txtbairthday=new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshScreen();
  }

  void refreshScreen(){
  listCustom.clear();
//  listCustom= UserMethod.getAllCustomer() as List;
  UserMethod.getAllCustomer().then(( vals){
  setState(() {
  vals.forEach((val){
  listCustom.add(val);
  });

  });

  });
  }

   var username="";

  @override
  Widget build(BuildContext context) {
    theme:textTheme ;

    double widthScreen = MediaQuery
        .of(context)
        .size
        .width;
    double heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(

//      drawer: MyDrawer(),
//      appBar: AppBar(
//        title: Text(
//            'home  Screen title '
//        ),

//      ),
      body: Center(

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/purple_background.jpg"),
                fit: BoxFit.cover),
          ),


          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 30, top: 30, left: 10, right: 10),
            child: SizedBox(

              child: Container(
                width: widthScreen,
                height: heightScreen,
                decoration: BoxDecoration(
//                  color: Colors.purple,
                  color: Color(0xFF460246),
//                    color: Color.fromARGB(255,114,73,173),
                  borderRadius: BorderRadius.circular(12),
//                  border: Border.all(color: Colors.purple,width: 1,style: BorderStyle.solid),

                ),
                child: Column(

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 30,top: 10),


                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed('/');

                          },
                          child: Icon(
                            Icons.clear,
                            size: 50,
                            color: Colors.grey,


                          ),
                        ),
                      ),

                    ),
                    getTitle(),
/*
  +  POINT_CUSTOMER
  */
                    Padding(padding: EdgeInsets.only(top: 20),),
                    myrow(Icons.person, "CUSTOMER_NAME"),
                    Padding(padding: EdgeInsets.only(top: 20),),
                    myrow(Icons.cake, "CUSTOMER_NAME"),

//                    myrow("point second screen", txtpoint),
                    Padding(padding: EdgeInsets.only(top: 20),),

                    myrow(Icons.phone, "PHONE_NO"),
                    Padding(padding: EdgeInsets.only(top: 20),),

                    myrow(Icons.email, "EMAIL"),


                    Padding(padding: EdgeInsets.only(top: 60),),
                    mypoints(),
                    myDivider(),

                     Text("Barcode", style: TextStyle(fontSize: 18,color: Colors.white)),

                     getBarcode(),





//             getCustomer(),
                  ],
                ),

              ),

            ),
          ),
          width: widthScreen, height: heightScreen,
        ),
      ),


    );
  }


    Widget myrow(IconData icone, String requiredfiled){
      return new  SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(right: 40,left: 40),
          child: Opacity(
            child: Container(
              decoration: BoxDecoration (
                color:  Color(0xFF460246),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),

              ),
              child: Row(
                children: <Widget>[

                  Padding(
                    padding:  EdgeInsets.all(10),
                    child: Icon(icone,size: 40,color: Colors.white,),
//                    child:      Text(name+" : ",style: TextStyle(fontSize: 20,color: Colors.white,),),

                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left:15.0),
                    child: Text( (listCustom[0][requiredfiled]),style: TextStyle(fontSize: 18,color: Colors.white),),
                  ),),



                ],
              ),
              width: MediaQuery.of(context).size.width,
            ),
            opacity: 0.9,),
        ),
      );
    }

    Widget getTitle() {
      return SizedBox(
        child: Container(
          child: Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 50,left: 150,right: 20,bottom: 20),),
              Text('My Profile',style: TextStyle(
                fontSize: 40,
                color: Colors.white,

              )),
//              Expanded(
////                child: Icon(
////                  Icons.clear
////                      ,size: 50,
////                  color: Colors.grey,
////                ),
//
//
//            ),

            ],
          ),
        ),
      );

    }
    Widget getCustomer() {
      return new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(itemCount: listCustom.length,itemBuilder: (BuildContext context,int position,){
                return new Card(

                  child: ListTile(
                    title: Text(listCustom[position]["CUSTOMER_NAME"],style: TextStyle(fontSize: 15),),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: (){
                            UserMethod.deleteCustomer(listCustom[position]["PHONE_NO"]);
//                         UserMethod.deleteAllCustomer();
//                         print(listCustom[position]["PHONE_NO"]);
                            refreshScreen();
//                            Fluttertoast.showToast(msg:"empty name",
//                                toastLength: Toast.LENGTH_SHORT,
//                                gravity: ToastGravity.CENTER,
//                                timeInSecForIos: 1,
//                                backgroundColor: Colors.red,
//                                textColor: Colors.white,
//                                fontSize: 16.0
//                            );
                          },
                        )

                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
        width: 500,      height: 250,

      );
    }

  Widget  mypoints() {
    double points=0;
    points=(listCustom[0]["POINT_CUSTOMER"]);
    return new  SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: Opacity(
          child: Container(
            decoration: BoxDecoration (
              color:  Color(0xFF460246),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),

            ),
            child: Row(
              children: <Widget>[

                Padding(
                  padding:  EdgeInsets.all(20),
                  child: Icon(Icons.card_giftcard,size: 70,color: Colors.white,),
//                    child:      Text(name+" : ",style: TextStyle(fontSize: 20,color: Colors.white,),),

                ),
//                Expanded(child: TextField(controller:txtpoint ,)),
              Text("Points",style: TextStyle(
                fontSize: 20,
                color: Colors.white,

              )),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding:  EdgeInsets.all(10),
                    width: 80,child: Text(("$points"),style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,

                  )),
                    decoration: BoxDecoration(
                      color:  Color(0xFF460246),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),
                    ),
                  ),
                ),



              ],
            ),
            width: MediaQuery.of(context).size.width-250,
          ),
          opacity: 0.8,),
      ),
    );

  }

  Widget myDivider() {
    return
      Divider(
      thickness: 5,
      height: 50,
      endIndent: 20,
      indent: 20,
      color: Colors.white,
    );
  }
  Widget getBarcode() {
    String phoneNo=(listCustom[0]["PHONE_NO"]);
    print(phoneNo);
    return Container(
      child: Center(
        //************************QR Barcode **********************************
        child: QrImage(
          data: phoneNo,
          version: QrVersions.auto,
          size: 150.0,
          gapless: false,
        ),
      ),
//      decoration: BoxDecoration(
//        image: DecorationImage(image: AssetImage("assets/images/qrcode.png"),fit:BoxFit.fill),
////      color: Colors.amber
//      ),
//      width: MediaQuery.of(context).size.width-120,
//      height: 150,
    )
   ;
  }

  }

