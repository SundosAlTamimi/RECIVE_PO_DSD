import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class mainLocalNotification extends StatefulWidget {
  @override
  _mainLocalNotificationState createState() => _mainLocalNotificationState();
}

class _mainLocalNotificationState extends State<mainLocalNotification> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin ;
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


    }
      void showNotification() async{
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'channelId', 'channelName', 'channelDescription',
          importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
          0, 'plain title', 'plain body', platformChannelSpecifics,
          payload: 'tahani');
    }
  @override
  Widget build(BuildContext context) {
    return Container(

       child : Scaffold(
      body: Container(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          RaisedButton(textColor: Colors.purple,child: Text("show Notification"),
          onPressed: showNotification,
          )
          ],
        ),
      ),
    ),
    );


  }
Future< void> onselectNotification(String payload)
{
  print("notify");
}
}
