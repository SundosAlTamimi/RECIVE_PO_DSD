import 'package:flutter/material.dart';
class RewardGallery extends StatefulWidget {
  @override
  _RewardGalleryState createState() => _RewardGalleryState();
}

class _RewardGalleryState extends State<RewardGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/purple_background.jpg"),
              fit: BoxFit.cover),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            getHedertitle(),
            getRewardDetailList(),

          ],
        ),
      ),
    );
  }
  Widget getHedertitle() {
    return new  SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 30,right: 10,left: 10),
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
                        child: Text("My Point",style: TextStyle(fontSize: 35,color: Color(0xFF460246),),),
                      )),



                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:  EdgeInsets.all(2),
                      child:    Text("20",style: TextStyle(fontSize: 30,color:Color(0xFF460246),),
                      ),

                    ),
                  ),
                  myDivider(),

                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:  EdgeInsets.all(2),
                      child:      Text("  Reward Gallary",style: TextStyle(fontSize: 30,color:Color(0x8A5C075C),),),

                    ),
                  ),



                ],
              ),
              width:MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height/5
          ),
          opacity: 0.8,),
      ),
    );


  }
  Widget myDivider() {
    return
      Divider(
        thickness: 5,
        height: 30,
        endIndent: 20,
        indent: 20,
        color:Color(0xFF460246),
      );
  }

  Widget fillListGallery() {
    return new  SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 40,right: 10,left: 10),
        child: Opacity(
          child: Container(
            decoration: BoxDecoration (
              color:  Colors.white,
              borderRadius: BorderRadius.circular(20),


            ),
            child:   fillRewardDetailList(),

            width:MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height/5,
//            height:650,
          ),
          opacity: 0.9,),
      ),
    );
  }

 Widget fillInformationReward() {
    return Padding(
      padding: const EdgeInsets.only(top:5.0),
      child: new Container(
        decoration: BoxDecoration (
          color:  Colors.white,
//          border: Border.all(color: Colors.black,width: 1,style: BorderStyle.solid),

          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0, // has the effect of softening the shadow
              spreadRadius: 2.0, // has the effect of extending the shadow
              offset: Offset(
                2.0, // horizontal, move right 10
                2.0, // vertical, move down 10
              ),
            )
          ],


        ),
        child:Row(children: <Widget>[
          Flexible(
              flex: 4,
              child: getFirstColumPicture()),
          Flexible(
              flex: 8,
              child: getSecondColumDetailPoint()),


        ],),

        width:MediaQuery.of(context).size.width-100,
        height:MediaQuery.of(context).size.height/5,

      ),
    );
 }

  Widget getFirstColumPicture() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(width: 80, height: 80,
              child:
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/coupe_glace.png"),
                      fit: BoxFit.cover),

                ),
              ),
            ),
          ),
          Text("Ice Cream",
              style: TextStyle(fontSize: 20, color: Color(0xFF460246))),
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF460246),
                  borderRadius: BorderRadius.circular(5),
//              border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Redeem Gift", style: TextStyle(fontSize: 20, color: Colors.white)),
                )),
          ),
        ],
      ),
    );

 }

 Widget getSecondColumDetailPoint() {
   return Container(

     child: Column(
       children: <Widget>[
         Padding(
           padding: const EdgeInsets.all(10),
           child: Container(
             width: MediaQuery.of(context).size.width-200,
               height: MediaQuery.of(context).size.height/6 ,
               decoration: BoxDecoration(
                 color: Color(0xFF460246),
                 borderRadius: BorderRadius.circular(5),
//              border: Border.all(color: Colors.white,width: 1,style: BorderStyle.solid),

               ),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: FractionalOffset.centerLeft,
//                   end: FractionalOffset.centerLeft,
//                   colors: [
//                     Colors.red.withOpacity(0.5),
//                     Colors.black.withOpacity(0.5),
//                   ],
//                   stops: [0.95, 5.0],
//                 ),
//               ),
               child: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text("ice cream (any type )", style: TextStyle(fontSize: 20, color: Colors.white)),
                     Text("575 point", style: TextStyle(fontSize: 20, color: Colors.white)),

                   ],
                 ),
               )),
         ),

       ],
     ),
   );

 }
 // create list of reward galary
 Widget getRewardDetailList() {
    return new  SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 20,right: 10,left: 10,bottom: 20),
        child: Opacity(
          child: Container(
            decoration: BoxDecoration (
              color:  Colors.white,
              borderRadius: BorderRadius.circular(20),


            ),
            child:   fillRewardDetailList(),

            width:MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height/1.5+40,
          ),
          opacity: 0.9,),
      ),
    );


  }
  Widget fillRewardDetailList() {
//    refreshScreen();

    return new Container(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(itemCount: 6,itemBuilder: (BuildContext context,int position,){
              return
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: fillInformationReward(),
                );

            }),
          )
        ],
      ),
      width: 500,      height: 250,

    );
  }
}
/*
 boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        spreadRadius: 10,
        blurRadius: 5,
        offset: Offset(0, 7), // changes position of shadow
      ),
    ],
    */
