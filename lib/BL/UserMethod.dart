import 'dart:async';
import 'dart:io';

import 'package:menu_flutter/DAL/DataBaseHelper.dart';
import 'package:menu_flutter/Models/CustomerInformation.dart';
import 'package:menu_flutter/Models/myNotification.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class UserMethod{
   static Future <int> addCustomer(CustomerInformation customer) async {
    Database mydb=await DataBaseHelper.database;
    Map<String,dynamic> userMap=new Map();
    userMap["CUSTOMER_NAME"]=customer.customerName;
    userMap["PHONE_NO"]=customer.phoneNo;

    userMap["EMAIL"]=customer.email;

    userMap["POINT_CUSTOMER"]=customer.point;
    mydb.insert("CUSTOMER_INFORMATION", userMap);
    print(customer.customerName);
  }
   static Future<List> getAllCustomer() async {
    Database mydb=await DataBaseHelper.database;
    List Customerlist=  await mydb.rawQuery("select * from CUSTOMER_INFORMATION");
//    mydb.close();
   print("CustomerInformlistSize");
   print(Customerlist.length);
   return Customerlist.toList();
  }
   static Future<int> deleteCustomer(String  phoneCustomer) async {
    print(phoneCustomer);
    Database mydb=await DataBaseHelper.database;
//    int result=await mydb.delete("CUSTOMER_INFORMATION ",where:"PHONE_NO =$phoneCustomer" );
    int re=await mydb.rawDelete('DELETE FROM CUSTOMER_INFORMATION  WHERE PHONE_NO = $phoneCustomer');

//   mydb.execute("DELETE FROM CUSTOMER_INFORMATION WHERE PHONE_NO =${phoneCustomer}");

//    if (result.length>=1){
//     print("deleted");
//
//    }
//    print(result.length);
    return re;

  }
   static Future <int> editCustomer(CustomerInformation oldCustomer)async{
    Database mydb=await DataBaseHelper.database;

    Map<String, dynamic> newCust=new Map();
    newCust["PHONE_NO"]=oldCustomer.phoneNo.toString();
    newCust["POINT_CUSTOMER"]=10;
    newCust["EMAIL"]=oldCustomer.email.toString();
    newCust["CUSTOMER_NAME"]=oldCustomer.customerName.toString();

    int result=await mydb.update("CUSTOMER_INFORMATION", newCust);
    return result;
  }
   static Future<void> deleteAllCustomer() async {
    Database mydb=await DataBaseHelper.database;
    mydb.execute("delete from CUSTOMER_INFORMATION");
    print("deleteAllCustomer");

   }

   //****************************Notification Method *****************************************
   static Future<List> getAllNotification() async {
    Database mydb=await DataBaseHelper.database;
    List Notificationlist=  await mydb.rawQuery("select * from NOTIFICATION");
    print("NOTIFICATIONlistSize");
    print(Notificationlist.length);
    return Notificationlist.toList();
   }
   static Future <int> addNotification(myNotification mynotif) async {
    Database mydb=await DataBaseHelper.database;
    Map<String,dynamic> userMap=new Map();
    userMap["DESCRIPTION2"]=mynotif.Description;
    userMap["DATE_FOR_NOTIFICATION2"]=mynotif.date;

    userMap["NOTIFICATION_NAME2"]=mynotif.notificationName;

    userMap["TIME_FOR_NOTIFICATION"]=mynotif.time;
    userMap["POINT_FOR_NOTIFICATION"]=mynotif.point;

    mydb.insert("NOTIFICATION", userMap);
    print("mynotif.Description");

    print(mynotif.Description);
   }
   static Future<void> deleteAllNotification() async {
    Database mydb=await DataBaseHelper.database;
    mydb.execute("delete from NOTIFICATION");
    print("deleteAllNOTIFICATION");

   }
   //************************************* End notification method *******************************************************

}