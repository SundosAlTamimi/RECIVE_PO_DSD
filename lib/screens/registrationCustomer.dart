import 'package:flutter/material.dart';
import 'package:menu_flutter/BL/UserMethod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menu_flutter/Models/CustomerInformation.dart';
class registrationCustomer extends StatefulWidget {
  @override
  _registrationCustomerState createState() => _registrationCustomerState();
}
TextEditingController txtname=new TextEditingController();
TextEditingController txtphone=new TextEditingController();

TextEditingController txtemail=new TextEditingController();

TextEditingController txtpoint=new TextEditingController();
double padingTopTitle=0,padingtopItem=0;

class _registrationCustomerState extends State<registrationCustomer> {
  List listCustom=new List();
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshScreen();
  }
  @override
  Widget build(BuildContext context) {
    double padSize=0;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    if(widthScreen>600){
      padSize=20;
      padingTopTitle=5;
      padingtopItem=5;

    }
    else {
      padSize = 200;
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

              child: Container(
                width: widthScreen,height: heightScreen,decoration: BoxDecoration (
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
                        getTitle(),

                        Padding(padding: EdgeInsets.only(top: padingtopItem),),
                        myrow("Customer Name",txtname),
                        Padding(padding: EdgeInsets.only(top: padingtopItem),),

                        myrow("point",txtpoint),
                        Padding(padding: EdgeInsets.only(top: padingtopItem),),

                        myrow("Phone No",txtphone),
                        Padding(padding: EdgeInsets.only(top: padingtopItem),),

                        myrow("Email",txtemail),


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
          width: widthScreen,height: heightScreen,
        ),
      ),

    );
  }
  Widget myrow(var name, var controllerName){
    return new  SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 1,left: 1),
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
                  padding:  EdgeInsets.all(5),
                  child:      Text(name+" : ",style: TextStyle(fontSize: 20,color: Colors.white,),),

                ),
                Expanded(child: TextField(controller:controllerName ,)),


              ],
            ),
            width: MediaQuery.of(context).size.width,
          ),
          opacity: 0.6,),
      ),
    );
  }
  Widget getTitle() {
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

//  List<dynamic> listd=new List();

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
                          Fluttertoast.showToast(msg:"empty name",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
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
}
