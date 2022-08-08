import 'package:flutter/material.dart';
import 'package:menu_flutter/Models/myNotification.dart';
import 'package:menu_flutter/widgets/menu.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snaplist/snaplist.dart';
class MyPoint extends StatefulWidget {
  @override
  _MyPointState createState() => _MyPointState();
}


class _MyPointState extends State<MyPoint> {
  List <myNotification> notificaList= new List();

  void refreshScreen() {
    notificaList.clear();

    setState(() {
      notificaList=myNotification.getListNotification();

    });

    print("notificaList.length=");

    print(notificaList.length);
  }

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
            galeryButton(),
            getPointsDetailList(),
         ],
        ),
      ),
    );
  }

 Widget getHedertitle() {
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
                        padding: const EdgeInsets.all(20.0),
                        child: Text("My Point",style: TextStyle(fontSize: 35,color: Color(0xFF460246),),),
                      )),



                   Align(
                     alignment: Alignment.center,
                     child: Padding(
                       padding:  EdgeInsets.all(2),
                       child:      Text("20",style: TextStyle(fontSize: 30,color:Color(0xFF460246),),),

                     ),
                   ),
               myDivider(),
               getPointDetail(),




             ],
           ),
           width:MediaQuery.of(context).size.width,
             height:MediaQuery.of(context).size.height/4
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

  Widget getPointDetail() {
    return new Container(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Row(

              children: <Widget>[
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 2),
                  child: Text("Redeemed",style: TextStyle(fontSize: 20,color:Color(0xAE302E30),)),
                )),
                getVirticalDivider(),
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: 30,right: 1),
                  child: Text("Visits",style: TextStyle(fontSize: 20,color:Color(0xAE302E30),)),
                )), getVirticalDivider(),

                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 10),
                  child: Text("Expired",style: TextStyle(fontSize: 20,color:Color(0xAE302E30),)),
                )),

              ],

            ),
            Row(

              children: <Widget>[
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: 40,right: 20),
                  child: Text("0",style: TextStyle(fontSize: 15,color:Color(0xAE302E30),)),
                )),

                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: 60,right: 20),
                  child: Text("0",style: TextStyle(fontSize: 15,color:Color(0xAE302E30),)),
                )),

                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: 80,right: 10),
                  child: Text("0",style: TextStyle(fontSize: 15,color:Color(0xAE302E30),)),
                )),

              ],

            ),
          ],
        ),

      ),
    );

  }

 Widget getVirticalDivider() {
   return
   Container(
     height: 50,

     child:      VerticalDivider(color: Color(0xFF460246), width: 40,thickness: 4,),
   );

     Divider(

       thickness: 2,
       height: 50,
       endIndent: 20,
       indent: 20,
       color:Color(0xFF460246),
     );
 }

 Widget galeryButton() {
   return  SizedBox(

     child: InkWell(
       onTap: (){ Navigator.of(context).pushNamed('/gallery');},
       child: Padding(
         padding: const EdgeInsets.only( top:30,right: 20,left: 20,bottom: 20),
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
                   child:      Center(child: InkWell(
                     onTap: (){},
                       child: Text(" My Reward Gallery ",style: TextStyle(fontSize: 25,color: Colors.white),))),

                 ),


               ],
             ),
             width:MediaQuery.of(context).size.width,
           ),
           opacity: 0.9,),
       ),
     ),
   );
 }

 Widget getPointsDetailList() {
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
           height:MediaQuery.of(context).size.height/2+10,
         ),
         opacity: 0.8,),
     ),
   );


 }


   Widget fillpointsDetailList() {
     refreshScreen();

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
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text( notificaList[position].point.toString(),style: TextStyle(fontSize: 20,color: Colors.white)),
                ),
                Text("Points",style:TextStyle(fontSize: 20,color: Colors.white)),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text( notificaList[position].Description.toString(),style: TextStyle(fontSize: 20,color: Colors.white)),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text("20-11-2019   04 : 12 AM",style:TextStyle(fontSize: 20,color: Colors.white)),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text("Expiry Date : ",style: TextStyle(fontSize: 20,color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text( notificaList[position].date.toString(),style: TextStyle(fontSize: 20,color: Colors.white)),
                ),

              ],
            ),
          ],
        ),
      ),

    );





  }
  }
  /* SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text("FIRST NAME"),
              numeric: false,
              tooltip: "This is First Name",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("LAST NAME"),
            numeric: false,
            tooltip: "This is Last Name",
          ),
        ],
        rows: users
            .map(
              (user) => DataRow(
              selected: selectedUsers.contains(user),
              onSelectChanged: (b) {
                print("Onselect");
                onSelectedRow(b, user);
              },
              cells: [
                DataCell(
                  Text(user.firstName),
                  onTap: () {
                    print('Selected ${user.firstName}');
                  },
                ),
                DataCell(
                  Text(user.lastName),
                ),
              ]),
        )
            .toList(),
      ),
    );
  }*/
//Widget build(BuildContext context) {
//  return SnapList(
//      sizeProvider => (index, data) => Size(100.0, 100.0),
//  separatorProvider => (index, data) => Size(10.0, 10.0),
//  builder: (context, index, data) => SizedBox(),
//  count: 1,
//  );
//}
// without animation list


//final Size cardSize = Size(100.0, 260.0);
//Widget fillpointsDetailList() {
//  refreshScreen();
//
//  return new Container(
//    child: Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      children: <Widget>[
//        Expanded(
//          child: ListView.builder(itemCount: notificaList.length,itemBuilder: (BuildContext context,int position,){
//            return
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: fillPointDetailList(context,position),
//              );
//
//          }),
//        )
//      ],
//    ),
//    width: 500,      height: 250,
//
//  );
//}
/*animated List
         AnimatedList(
               initialItemCount: notificaList.length,
               itemBuilder: ( context,position,animation){
             return
                 SlideTransition(
                   position: animation.drive(MyTween()),
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: fillPointDetailList(context,position),
                   ),
                 );
           }

           ),
* */
// scrool like wheels
/*FixedExtentScrollController fixedExtentScrollController =
    new FixedExtentScrollController();
ListWheelScrollView(
  controller: fixedExtentScrollController,
  physics: FixedExtentScrollPhysics(),
  children: monthsOfTheYear.map((month) {
    return Card(
        child: Row(
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            month,
            style: TextStyle(fontSize: 18.0),
          ),
        )),
      ],
    ));
  }).toList(),
  itemExtent: 60.0,
),*/

