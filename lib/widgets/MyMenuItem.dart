import 'package:flutter/material.dart';
import 'package:menu_flutter/screens/home_screen.dart';
import 'package:menu_flutter/screens/second_screen.dart';
import 'package:menu_flutter/screens/third_screen.dart';
import 'package:menu_flutter/utils/theme.dart';
class MyMenuItem extends StatelessWidget {
//  get context => context;

  @override
  Widget build(BuildContext context) {
    mythemeData;
    return new Column(
      children: <Widget>[
        Container(

          child: ListTile(
            title: Text('Transfer Point',style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),),
            leading:  Icon(Icons.loop),
            onTap: ( ){
//              Navigator.of(context).pushNamed('/third');
              transferPointDialog(context);
//              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)
//              {
//                return Second_Screen();
//              }
//              ),
//              );



            },
          ),
        ),
        Container(

          child: ListTile(
            title: Text('Language setting',style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),),
            leading:  Icon(Icons.translate),
            onTap: ( ){
              openLanguageSettingDialog(context);


            },
          ),
        ),
        Container(

          child: ListTile(
            title: Text('Customer Register',style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),),
            leading:  Icon(Icons.translate),
            onTap: ( ){
              Navigator.of(context).pushNamed('/registerCust');
//              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)
//              {
//                return Third_Screen();
//              }
//              ),
//              );

            },
          ),
        ),
        Container(

          child: ListTile(
            title: Text('App Developers',style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),),
            leading:  Icon(Icons.info),
            onTap: ( ){
              openDeveloperDialog(context);
//              Navigator.of(context).pushNamed('/third');
//              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)
//              {
//                return Third_Screen();
//              }
//              ),
//              );

            },
          ),
        ),
        Container(

          child: ListTile(
            title: Text('MyPoint',style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),),
            leading:  Icon(Icons.card_giftcard),
            onTap: ( ){

              Navigator.of(context).pushNamed('/myPoint');

            },
          ),
        ),
      ],

    );
  }

  void transferPointDialog(BuildContext context) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 500.0,
        width: 500.0,

        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/purple_background.jpg"),fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),

              child: getTitle(context),
            ),
            sentInformation(context)
        ,
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.white,

                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(fontSize: 20.0, color: Color(0xFF460246),),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: ( context) => simpleDialog);


  }

  Widget getTitle(BuildContext context) {
  return  SizedBox(

      child: Padding(
        padding: const EdgeInsets.only( top:50,right: 10,left: 10,bottom: 20),
        child: Opacity(
          child: Container(
            decoration: BoxDecoration (
              color:  Color(0xFF460246),
              borderRadius: BorderRadius.circular(10),
//              border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Padding(
                  padding:  EdgeInsets.all(5),
                  child:      Center(child: Text(" Transfer Points ",style: TextStyle(fontSize: 30,color: Colors.white),)),

                ),


              ],
            ),
            width:400,
          ),
          opacity: 0.9,),
      ),
    );


  }

  sentInformation(BuildContext context) {
    return new  SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: Opacity(
          child: Container(
            decoration: BoxDecoration (
              color:  Colors.white,
              borderRadius: BorderRadius.circular(20),
//              border: Border.all(color: Color(0xFF460246),width: 1,style: BorderStyle.solid),

            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[

                    Padding(
                      padding:  EdgeInsets.all(5),
                      child:      Text("Total Point :",style: TextStyle(fontSize: 20,color: Color(0xFF460246),),),

                    ),
                    Expanded(child: TextField()),


                  ],
                ),
                Row(
                  children: <Widget>[

                    Padding(
                      padding:  EdgeInsets.all(5),
                      child:      Text("# Point To Send : ",style: TextStyle(fontSize: 20,color:Color(0xFF460246),),),

                    ),
                    Expanded(child: TextField()),


                  ],
                ),
                Row(
                  children: <Widget>[

                    Padding(
                      padding:  EdgeInsets.all(5),
                      child:      Text("Phone No :",style: TextStyle(fontSize: 20,color:Color(0xFF460246)),),

                    ),
                    Expanded(child: TextField()),


                  ],
                ),
              ],
            ),
            width:400,
            height: 200,
          ),
          opacity: 0.8,),
      ),
    );





  }

  void openDeveloperDialog(BuildContext context) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 600.0,
        width: 500.0,
//        color:  Color(0xA9FAF7F7),

        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/purple_background.jpg"),fit: BoxFit.cover),
        ),
        child: Container(
          color:Color(0x90FFFEFE),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),

                child: getfalconLogo(context),
              ),
              developerInformation(context,Icons.web,"https://falconssoft.com/"),
          developerInformation(context,Icons.phone,"+962-6-5656597"),
          developerInformation(context,Icons.phone,"+962-6-5658736"),
          developerInformation(context,Icons.email,"info@falconssoft.com"),
          developerInformation(context,Icons.location_on,"Adel Al-Qasem Complex, 8th Floor, Jabal Al-Hussein, Amman, Jordan"),



            ],
          ),
        ),
      ),
    );
    showDialog(
        context: context, builder: ( context) => simpleDialog);
  }

 Widget getfalconLogo(BuildContext context) {
   return  SizedBox(

     child: Padding(
       padding: const EdgeInsets.only( top:20,right: 10,left: 10,bottom: 20),
       child: Opacity(
         child: Container(
           decoration: BoxDecoration (
             color:  Color(0x2C880688),
             borderRadius: BorderRadius.circular(10),
             image: DecorationImage(image: AssetImage("assets/images/falconssoftlogo.png"),fit: BoxFit.contain),
              border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),

           ),
           width:200,
           height: 150,
         ),
         opacity: 0.9,),
     ),
   );

  }

 Widget developerInformation(BuildContext context,IconData icone, String requiredfiled) {

     return new  SizedBox(
       child: Padding(
         padding: const EdgeInsets.only(right: 40,left: 40),
         child: Opacity(
           child: Container(
//             decoration: BoxDecoration (
//               color:  Color(0xFF460246),
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),
//
//             ),
             child: Row(
               children: <Widget>[

                 Padding(
                   padding:  EdgeInsets.all(10),
                   child: Icon(icone,size: 40,   color:  Color(0xFF460246),),
//                    child:      Text(name+" : ",style: TextStyle(fontSize: 20,color: Colors.white,),),

                 ),
                 Expanded(child: Padding(
                   padding: const EdgeInsets.only(left:15.0),
                   child: Text( requiredfiled,style: TextStyle(fontSize: 18,   color:  Color(0xFF460246),),),
                 ),),



               ],
             ),
             width: MediaQuery.of(context).size.width,
           ),
           opacity: 0.8,),
       ),
     );
   }

  void openLanguageSettingDialog(BuildContext context) {
    Dialog settingDialog=Dialog(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200.0),
      ),
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/purple_background.jpg"),fit: BoxFit.cover),
        ),
          child: Column(
            children: <Widget>[
              SizedBox(

                child: Padding(
                  padding: const EdgeInsets.only( top:70,right: 10,left: 10,bottom: 20),
                  child: Opacity(
                    child: Container(
                      decoration: BoxDecoration (
                        color:  Color(0x92880688),
                        borderRadius: BorderRadius.circular(20),
//                    image: DecorationImage(image: AssetImage("assets/images/falconssoftlogo.png"),fit: BoxFit.contain),
                        border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),

                      ),
                      width:200,
                      height: 100,
                      child: Align(alignment: Alignment.center,
                          child: Text("English",style: TextStyle(fontSize: 18,   color:  Colors.white,))),
                    ),
                    opacity: 0.9,),
                ),
              ),
              SizedBox(

                child: Padding(
                  padding: const EdgeInsets.only( top:20,right: 10,left: 10,bottom: 20),
                  child: Opacity(
                    child: Container(
                      decoration: BoxDecoration (
                        color:  Color(0x92880688),
                        borderRadius: BorderRadius.circular(20),
//                    image: DecorationImage(image: AssetImage("assets/images/falconssoftlogo.png"),fit: BoxFit.contain),
                        border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),

                      ),
                      width:200,
                      height: 100,
                      child: Align(alignment: Alignment.center,
                          child: Text("عربي",style: TextStyle(fontSize: 18,   color:  Colors.white,))),
                    ),
                    opacity: 0.9,),
                ),
              ),
            ],

          )
      ),

    );
    showDialog(context: context,builder: (context)=>settingDialog);
  }
 }

/*
,Text(
    'Transfer Points',
    style: TextStyle(color: Colors.white),
    ),
    */
