import 'package:flutter/material.dart';
class myNotification{
  String Description;
  String date ;
  String notificationName ;
  String time  ;
  String point  ;

  myNotification(this.Description, this.date, this.notificationName, this.time,
      this.point);
  static List<myNotification> getListNotification() {
    return <myNotification>[
    myNotification(
    "DescriptionNote1", "16/1/2020", "notificaName", "time","+10 "),
    myNotification(
    "DescriptionNote2", "16/1/2020", "notificaName", "time","+20 "),
    myNotification(
    "DescriptionNote3", "16/1/2020", "notificaName", "time","+30 "),
    myNotification(
    "DescriptionNote4", "16/1/2020", "notificaName", "time","+40 "),
    myNotification(
    "DescriptionNote5", "16/1/2020", "notificaName", "time","+50 "),
      myNotification(
          "DescriptionNote6", "16/1/2020", "notificaName", "time","+50 "),
    ];
  }


}
