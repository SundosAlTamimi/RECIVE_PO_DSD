import 'package:flutter/material.dart';
import 'package:menu_flutter/BL/UserMethod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menu_flutter/Models/CustomerInformation.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:menu_flutter/Models/myNotification.dart';
import 'package:intl/intl.dart';
import 'package:menu_flutter/utils/theme.dart';
class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}
TextEditingController txtAuthentication=new TextEditingController();
TextEditingController txtphone=new TextEditingController();

TextEditingController txtemail=new TextEditingController();

TextEditingController txtpoint=new TextEditingController();
TextEditingController txtname=new TextEditingController();

double padingTopTitle=0,padingtopItem=0;

class _LogInState extends State<LogIn> {
  List listCustom=new List();
  double widthScreen;
  double heightScreen;

  //**************************Notification Code *************************************************
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin ;
  void showNotification() async{
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'Point', 'thank you for downloading Points App  Authintecation code is 1234 ', platformChannelSpecifics,
        payload: 'tahani');
  }






  void refreshScreen(){
    listCustom.clear();
//  listCustom= UserMethod.getAllCustomer() as List;
    UserMethod.getAllCustomer().then(( vals){
      setState(() {
        print("valslength");
        print(vals.length);
        vals.forEach((val){
          listCustom.add(val);
        });

      });

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android =    new AndroidInitializationSettings('app_icon');
    var iOS = IOSInitializationSettings();

    var initializationSettings = InitializationSettings( android, iOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onselectNotification);
    refreshScreen();
  }
  Future< void> onselectNotification(String payload)
  {
    print("notify");
  }
  @override
  Widget build(BuildContext context) {
    double padSize=0;

     widthScreen = MediaQuery.of(context).size.width;
     heightScreen = MediaQuery.of(context).size.height;

    if(widthScreen>600){
      padSize=20;
      padingTopTitle=5;
      padingtopItem=5;

    }
    else {
      padSize = 20;
      padingTopTitle=50;
      padingtopItem=20;
    }
    return Scaffold(
      body:Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/purple_background.jpg"),fit: BoxFit.cover),
          ),


          child: Padding(
            padding: EdgeInsets.only(top: 20.0,bottom: padSize,left: 10,right: 10),


            child: SizedBox(
              width: widthScreen,height: heightScreen/4,
              child: Padding(
                padding:  EdgeInsets.only(top:heightScreen/4,bottom:heightScreen/4),
                child: Container(
                  width: widthScreen,height: heightScreen/4,decoration: BoxDecoration (
//                  color: Colors.purple,
                  color:  Color(0xFF460246),
//                    color: Color.fromARGB(255,114,73,173),
                  borderRadius: BorderRadius.circular(12),
//                  border: Border.all(color: Colors.purple,width: 1,style: BorderStyle.solid),

                ),
                  child: Wrap(
                    children: <Widget>[
                      Column(

                        children: <Widget>[
                          getTitle(),

                          Padding(padding: EdgeInsets.only(top: padingtopItem),),
                          myrow("Customer Name",txtAuthentication),
                          Padding(padding: EdgeInsets.only(top: padingtopItem),),

                          Padding(padding: EdgeInsets.only(top: 40),),
                          getButtons(),


                        ],
                      ),
                    ],
                  ),

                ),
              ),

            ),
          ),
          width: widthScreen,height: heightScreen,
        ),
      ),


    );
  }
  Widget myrow(var name, var controllerName){
    return new  SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 50,left: 1),
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
                  padding: EdgeInsets.all(5),
            child: Icon(Icons.lock, color: Colors.white,),

          ),
          Expanded(child: TextField(controller: controllerName,
              decoration: InputDecoration.collapsed(hintText: "Enter Code",
              hintStyle: TextStyle(color: Colors.white)),
          style: TextStyle(color: Colors.white),)),


      ],
    ),
    width: MediaQuery
                .of(context)
                .size
                .width / 2,
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
            Padding(padding: EdgeInsets.only(top: padingTopTitle,left: 50,right: 20,bottom: 50),),
            Text('Authentication Code ',style: TextStyle(
              fontSize: 30,
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

 Widget getButtons() {
    return
      SizedBox(

        child: Container(

          child: Column(
            children: <Widget>[
              Container(
                width: widthScreen/3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white,
                      width: 1,
                      style: BorderStyle.solid),

                ),
                child: FlatButton(
                  child: Text("Log In",
                    style: TextStyle(
                      fontSize: 25, color:  Color(0xFF460246),),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/homeScreen');
                    print("clickhomeScreen");
                    if(txtAuthentication.text.length>0 && txtphone.text.length>0 && txtemail.text.length>0)
                    {
                      UserMethod.deleteAllCustomer();
                      print("deleted all");
                      UserMethod.addCustomer(new CustomerInformation(txtAuthentication.text, txtphone.text, txtemail.text, double.parse(txtpoint.text), "5-1"));

                      txtAuthentication.text="";



                    }
                    refreshScreen();
                  },


                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                width: widthScreen/3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white,
                      width: 1,
                      style: BorderStyle.solid),

                ),
                child: FlatButton(
                  child: Text( "Sighn Up",
                    style: TextStyle(fontSize: 25, color:  Color(0xFF460246),),
                  ),
                  onPressed: () {
                    print("click");
                    SighnUpDialog();

                  },


                ),
              ),
//              Padding( padding:  EdgeInsets.all(20),),

            ],
          ),
          width: 180,
        ),

      );
 }
  void SighnUpDialog() {
    double padSize=0;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    if(widthScreen>600){
      padSize=20;
      padingTopTitle=5;
      padingtopItem=5;

    }
    else {
      padSize = 20;
      padingTopTitle=50;
      padingtopItem=20;
    }
    Dialog simpleDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Container(
//
          width: widthScreen-100,height: heightScreen/1.5,
//        width: 600,
//            height: 600,

          child: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/purple_background.jpg"),fit: BoxFit.cover),
              ),


              child: Padding(
                padding: EdgeInsets.only(top: 20.0,bottom: 20,left: 10,right: 10),


                child: SizedBox(

                  child: Container(
//                        width: widthScreen,height: heightScreen,
                    decoration: BoxDecoration (
//                  color: Colors.purple,
                      color:  Color(0xFF460246),
//                    color: Color.fromARGB(255,114,73,173),
                      borderRadius: BorderRadius.circular(12),
//                  border: Border.all(color: Colors.purple,width: 1,style: BorderStyle.solid),

                    ),
                    child: Wrap(
                      children: <Widget>[
                        Column(

                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20),

                              child: Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.clear,
                                  size: 50,
                                  color: Colors.grey,

                                ),
                              ),

                            ),
                            getTitleSighUp(),

                            Padding(padding: EdgeInsets.only(top: padingtopItem),),
                            myrowSighUp("Customer Name",txtname),
                            Padding(padding: EdgeInsets.only(top: padingtopItem),),

                            myrowSighUp("point",txtpoint),
                            Padding(padding: EdgeInsets.only(top: padingtopItem),),

                            myrowSighUp("Phone No",txtphone),
                            Padding(padding: EdgeInsets.only(top: padingtopItem),),

                            myrowSighUp("Email",txtemail),


                            Padding(padding: EdgeInsets.only(top: 40),),

                            SizedBox(
                              child: Opacity(
                                child: Container(
                                  decoration: BoxDecoration (
//              color: Colors.purple,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),

                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      FlatButton(
                                        child: Text( "Sighn Up",
                                          style: TextStyle(fontSize: 25,color: Colors.white),
                                        ),
                                        onPressed: () {
                                          showNotification();
                                          addnewNotification(30);

                                          Navigator.of(context).pushNamed('/homeScreen');
                                          print("click");
                                          if(txtname.text.length>0 && txtphone.text.length>0 && txtemail.text.length>0)
                                          {
                                            UserMethod.deleteAllCustomer();
                                            print("deleted all");
                                            UserMethod.addCustomer(new CustomerInformation(txtname.text, txtphone.text, txtemail.text, double.parse(txtpoint.text), "5-1"));

                                            txtname.text="";
                                            txtphone.text="";
                                            txtemail.text="";
                                            txtpoint.text="";


                                          }
                                          else{
                                            Fluttertoast.showToast(msg:"empty name",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIos: 1,
                                                backgroundColor: Colors.white,
                                                textColor: Theme.of(context).accentColor,
                                                fontSize: 16.0
                                            );
                                          }
                                          refreshScreen();
                                        },


                                      ),
//              Padding( padding:  EdgeInsets.all(20),),

                                    ],
                                  ),
                                  width: 180,
                                ),
                                opacity: 0.6,
                              )
                              ,
                            ),
//             getCustomer(),
                          ],
                        ),
                      ],
                    ),

                  ),

                ),
              ),
              width: widthScreen-100,height: heightScreen/1.5,
            ),

          ),

        )
    );
    showDialog(
        context: context, builder: ( context) => simpleDialog);
  }
  Widget myrowSighUp(var name, var controllerName){
    return new  SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 5,left: 5),
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
                  padding:  EdgeInsets.all(7),
                  child:      Text(name+" : ",style: TextStyle(fontSize: 20,color: Colors.white,),),

                ),
                Expanded(child: TextField(controller:controllerName , decoration: InputDecoration.collapsed(hintText: ""),)),


              ],
            ),
            width: MediaQuery.of(context).size.width,
          ),
          opacity: 0.6,),
      ),
    );
  }
  Widget getTitleSighUp() {
    return SizedBox(
      child: Container(
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: padingTopTitle,left: 150,right: 20,bottom: 20),),
            Text('Register',style: TextStyle(
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

  void addnewNotification(int pointValue) {
    String pointStr=pointValue.toString();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('kk:mm:a').format(now);
    print("formattedDate");
    print(formattedDate);
    print(formattedTime);
    UserMethod.addNotification(new myNotification("thank you for downloading Points App  Authintecation code is 1234", formattedDate, "download notification", formattedTime,pointStr));
  }



}
