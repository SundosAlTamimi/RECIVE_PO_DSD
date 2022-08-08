import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:menu_flutter/BL/UserMethod.dart';
import 'package:menu_flutter/Models/CustomerInformation.dart';
import 'package:menu_flutter/widgets/menu.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

TextEditingController txtname=new TextEditingController();
TextEditingController txtphone=new TextEditingController();

TextEditingController txtemail=new TextEditingController();

TextEditingController txtpoint=new TextEditingController();
bool listNotEmpty=false;
 double padingTopTitle=0,padingtopItem=0;
class _Home_ScreenState extends State<Home_Screen> {
  double parentWidth = 0;
  double parentheight = 0;
  List listCustom = new List();
  void refreshScreen() {
    listCustom.clear();
    UserMethod.getAllCustomer().then((vals) {
      setState(() {
        if (vals.length != 0) {
//          EmptyDialog();

          debugPrint("truenotzero");
        } else {
//          EmptyDialog();
          debugPrint("falseyeszero");
        }
        vals.forEach((val) {
          listCustom.add(val);
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

  @override
  Widget build(BuildContext context) {
   parentWidth= MediaQuery.of(context).size.width;
   parentheight= MediaQuery.of(context).size.height;
//   SystemChrome.setPreferredOrientations(DeviceOrientation.portraitUp);

    double padSize = 0;
    double widthScreen = MediaQuery
        .of(context)
        .size
        .width;
    double heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    if (widthScreen > 600) {
      padSize = 20;
      padingTopTitle = 5;
      padingtopItem = 5;
    }
    else {
      padSize = 200;
      padingTopTitle = 50;
      padingtopItem = 20;
    }

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
       actions: <Widget>[
//         Text('Barcode'),
         InkWell(
           onTap: (){
//             barcodeDialog(context);
//             EmptyDialog();
           },
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               decoration: BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage("assets/images/qrcode.png"),
                     fit: BoxFit.fill),
               ),
               width: 40,
               height: 40,
             ),
           ),
         )
       ],
        title: Text(
            'Point App  '
        ),

      ),
      body: Center(

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/purple_background.jpg"),
                fit: BoxFit.cover),
          ),
          child: Container(
            color: Color(0x90FFFEFE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                Wrap(children: <Widget>[
                  getBotumList(),
                ],)
              ],

            ),
          ),


          width: widthScreen, height: heightScreen,
        ),
      ),


    );
  }

  void barcodeDialog(BuildContext context) {
     String phoneNo=(listCustom[0]["PHONE_NO"]);
     print(phoneNo);
    Dialog simpleDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(

            height: 300.0,
            width: 300.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                //************************QR Barcode **********************************
                child: QrImage(
                  data: phoneNo,
                  version: QrVersions.auto,
                  size: 200.0,
                  gapless: false,
                ),
              ),
            )
        )
    );
    showDialog(
        context: context, builder: ( context) => simpleDialog);
  }
/*     body: new ListView.builder(
          itemCount: id == null ? 0 : id.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector( //You need to make my child interactive
              onTap: () => print(id[index]),
              child: new Card( //I am the clickable child
                child: new Column(
                  children: <Widget>[
                    //new Image.network(video[index]),
                    new Padding(padding: new EdgeInsets.all(3.0)),
                    new Text(id[index],
                      style: new TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),


                  ],
                ),),
            );
          }),*/
 Widget getBotumList() {
    return Container(
        color:Color(0xFF460246),
        width: parentWidth, height: parentheight/6,
//        child: ListView
//            .builder(
//            itemCount: 8,
//            itemBuilder: (BuildContext context, int index)
//            {
//   return  new

  child: ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
    Container(

          child: Row(children: <Widget>[
            GestureDetector(
                
                child: getItemList("Profile", Icons.person),
              onTap: (){
                  NavigationMethod(0);
                  },
            ),
            SizedBox(width: 5,),
            GestureDetector(child: getItemList("Notification", Icons.notifications_active),
            onTap: (){
//              EmptyDialog();
              NavigationMethod(1);
            },),
            SizedBox(width: 5,),


            GestureDetector(child: getItemList("Barcode", Icons.picture_in_picture),
            onTap: (){
              barcodeDialog(context);
            },),
            SizedBox(width: 5,),
//          getItemList("point","assets/images/nav.jpg"),
            GestureDetector(child: getItemList("point", Icons.card_giftcard),
            onTap: (){
              NavigationMethod(3);
            },),
            SizedBox(width: 5,),
            GestureDetector(

              child: getItemList("Profile", Icons.person),
              onTap: (){
                NavigationMethod(0);
              },
            ),
            SizedBox(width: 5,),
            GestureDetector(child: getItemList("Notification", Icons.notifications_active),
              onTap: (){
                NavigationMethod(1);
              },),
            SizedBox(width: 5,),


            GestureDetector(child: getItemList("Barcode", Icons.picture_in_picture),
              onTap: (){
                barcodeDialog(context);
              },),
            SizedBox(width: 5,),
//          getItemList("point","assets/images/nav.jpg"),
            GestureDetector(child: getItemList("point", Icons.card_giftcard),
              onTap: (){
                NavigationMethod(3);
              },),
            SizedBox(width: 5,),



          ])



      ),
    ],

  )
//   )


    );
 }
//  onTap: () => NavigationMethod(index),);
// Widget getItemList(String name,String fileImage) {
  Widget getItemList(String name, IconData iconimage) {
      return Container(
      width:parentWidth/4,
          height: parentheight/6,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Color(0xFF460246),

              child: name != "Barcode" ? Column(children: <Widget>[
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        iconimage, size: parentWidth / 12, color: Colors.white,),

//              child: Image(image: AssetImage(fileImage),),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(name, style: TextStyle(
                        color: Colors.white, fontSize: parentWidth / 25),),
                  ),
                )
              ],) :
              Column(children: <Widget>[
                Flexible(
                  flex: 3,        child:
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
//              child: Icon(iconimage,size: parentWidth/10,color:Colors.white,),
                      child: Image(image: AssetImage("assets/images/qrcode.png"),),
                    ),

                  ),
                ),
                Flexible(
                  flex: 4,             child:
                Padding(
                    padding: const EdgeInsets.only(top:18.0,left: 5,right: 5,bottom: 5),
                    child: Text(name, style: TextStyle(
                        color: Colors.white, fontSize: parentWidth / 25),),
                  ),
                )
              ],),
            ),
          ),
//      ),

      );
  }

  NavigationMethod(int pageIndex) {
    switch (pageIndex) {
      case 0:
        print("0 clickedProfile");
        Navigator.of(context).pushNamed('/second');



        break;
      case 1:
        print("1 clickedNotification");
        Navigator.of(context).pushNamed('/localNotifi');



        break;
      case 2:
        print("2clickedProfile");
        Navigator.of(context).pushNamed('/second');



        break;
      case 3:
        print("3clickedpoint");
        Navigator.of(context).pushNamed('/myPoint');



        break;
    }
  }







  //************************Normal Barcode *****************************
//       child: BarCodeImage(
//           params:  UPCABarCodeParams(
//             "65833250884",
//             withText: true
//
//           ),
//********************************************************************

}
//double width = MediaQuery.of(context).size.width;
//double height = MediaQuery.of(context).size.height;
//double height35 = height * 0.35;




isCustomerListImpty() {
  UserMethod.getAllCustomer().then(( vals){

    if(vals.length!=0)
    {
      listNotEmpty=true;

    }
    else{
      listNotEmpty=false;
    }
  });
}