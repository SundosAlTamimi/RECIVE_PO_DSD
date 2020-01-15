import 'package:flutter/material.dart';
import 'package:menu_flutter/BL/UserMethod.dart';
import 'package:menu_flutter/Models/CustomerInformation.dart';
import 'package:menu_flutter/widgets/menu.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:barcode_flutter/barcode_flutter.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

TextEditingController txtname=new TextEditingController();
TextEditingController txtphone=new TextEditingController();

TextEditingController txtemail=new TextEditingController();

TextEditingController txtpoint=new TextEditingController();
 double padingTopTitle=0,padingtopItem=0;
class _Home_ScreenState extends State<Home_Screen> {
//  List listCustom=new List();
//  void refreshScreen(){
//    listCustom.clear();
////  listCustom= UserMethod.getAllCustomer() as List;
//  UserMethod.getAllCustomer().then(( vals){
//    setState(() {
//      vals.forEach((val){
//        listCustom.add(val);
//      });
//
//    });
//
//  });
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    barcodeDialog(context);
//    refreshScreen();
  }

  @override
  Widget build(BuildContext context) {
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

//    Image.asset(
//    "assets/images/purple_background.jpg",
//      height: MediaQuery.of(context).size.height,
//      width: MediaQuery.of(context).size.width,
//      fit: BoxFit.cover,

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
       actions: <Widget>[
//         Text('Barcode'),
         InkWell(
           onTap: (){
             barcodeDialog(context);
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

            ),
          ),


          width: widthScreen, height: heightScreen,
        ),
      ),


    );
  }

  void barcodeDialog(BuildContext context) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(

        height: 200.0,
        width: 300.0,
//        color:  Color(0xA9FAF7F7),

//        decoration: BoxDecoration(
//          image: DecorationImage(image: AssetImage("assets/images/qrcode.png"),fit: BoxFit.fill),
//
//        ),
     child:  Center(
       child: BarCodeImage(
           params:  UPCABarCodeParams(
             "65833250884",
             withText: true

           ),

//        child: Container(
//          width: 100,
//          height: 100,
//          child:     BarCodeImage(
//            data: "CODE39",
//            codeType: BarCodeType.Code39,
//            hasText: true,
////            params: Code39BarCodeParams(
////              "1234ABCD",
////              lineWidth: 2.0,                // width for a single black/white bar (default: 2.0)
////              barHeight: 90.0,               // height for the entire widget (default: 100.0)
////              withText: true,                // Render with text label or not (default: false)
////            ),
//            onError: (error) {               // Error handler
//              print('error = $error');
//            },
//          ),
//
          ),
     ),

      ),
    );
    showDialog(
        context: context, builder: ( context) => simpleDialog);
  }
}
//double width = MediaQuery.of(context).size.width;
//double height = MediaQuery.of(context).size.height;
//double height35 = height * 0.35;

