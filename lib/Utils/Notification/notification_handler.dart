
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_controller.dart';
import 'package:package_delivery/main.dart';

class NotificationHandler {
  static final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

  static BuildContext? myContext;

  static void initNotification(BuildContext context) {
    myContext = context;
    var initAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initIOS = const IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initSetting = InitializationSettings(android: initAndroid,iOS: initIOS);
    flutterLocalNotificationPlugin.initialize(initSetting,onSelectNotification: onSelectNotification);
  }


  static Future onSelectNotification(String? payload) async {
    debugPrint('payload : ${payload.toString()}');
    if(payload != null) {
      debugPrint('onSelectNotification payload : ${payload.toString()}');
      try {
        final logic = Get.find<DashboardLogic>();
        logic.changeTabIndex(1);

      } catch (e) { 
        debugPrint('onSelectNotification => ERROR : $e');
      }
    }
  }

  static Future onDidReceiveLocalNotification(int? id,String? title, String? body, String? payload) async {
    debugPrint('onDidReceiveLocalNotification => id : $id');
    debugPrint('onDidReceiveLocalNotification => title : $title');
    debugPrint('onDidReceiveLocalNotification => body : $body');
    debugPrint('onDidReceiveLocalNotification => payload : $payload');

    // showDialog(context: myContext!, builder: (context)=>CupertinoAlertDialog(
    //   title: Text(title.toString()),
    //   content: Text(body.toString()),
    //   actions: [
    //     CupertinoDialogAction(
    //         isDefaultAction: true,
    //         onPressed: (){
    //           Navigator.of(context,rootNavigator: true).pop();
    //         },
    //         child: Text("OK"))
    //   ],
    // ));
  }

  // static _displayDialog(BuildContext context,String channel) {
  //   showGeneralDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return Scaffold(
  //         backgroundColor: Colors.grey[300],
  //         body: SafeArea(
  //           child: Container(
  //             width: MediaQuery.of(context).size.width,
  //             height: MediaQuery.of(context).size.height,
  //             padding: EdgeInsets.all(20),
  //             color: Colors.grey[300],
  //             child: Stack(
  //               children: [
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Container(
  //                       // width: MediaQuery.of(context).size.width * 0.3,
  //                       // height: MediaQuery.of(context).size.height * 0.1,
  //                       // alignment: Alignment.center,
  //
  //                       decoration: BoxDecoration(
  //                           color: Colors.grey,
  //                           shape: BoxShape.circle,
  //                           border: Border.all(
  //                               color: Colors.black
  //                           )
  //                         // borderRadius: BorderRadius.c
  //                       ),
  //                       child: Icon(Icons.person,color: Colors.black,size: MediaQuery.of(context).size.height * 0.1,),
  //                     ),
  //                     SizedBox(width: 20),
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       // mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text('Incoming Video Call', style: TextStyle(color: Colors.black, fontSize: 20.0)),
  //                         Text('$channel', style: TextStyle(color: Colors.black, fontSize: 20.0)),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 Column(
  //                   // mainAxisSize: MainAxisSize.max,
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       crossAxisAlignment: CrossAxisAlignment.end,
  //                       children: [
  //                         RawMaterialButton(
  //                           onPressed: () { FlutterLocalNotificationsPlugin().cancelAll();  Navigator.pop(context);  },
  //                           child: Icon(Icons.call_end, color: Colors.white, size: 35.0),
  //                           shape: CircleBorder(),
  //                           elevation: 2.0,
  //                           fillColor: Colors.redAccent,
  //                           padding: const EdgeInsets.all(15.0)),
  //                         RawMaterialButton(
  //                           onPressed: () async {
  //                             FlutterLocalNotificationsPlugin().cancelAll();
  //                             Navigator.pop(navigatorKey.currentState!.context);
  //                             debugPrint('channel : $channel');
  //                             // await
  //                             // Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoCallScreen(channelName: channel) ));
  //                             // Navigator.push(navigatorKey.currentState!.context,new MaterialPageRoute(builder: (context) => VideoCallScreen(channelName: channel)));
  //                             // navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => VideoCallScreen(channelName: channel)));
  //                             // Navigator.of(context).pushNamed(message['screen'],arguments: {'channelName': channel});
  //                           },//_onToggleMute,
  //                           child: Icon(Icons.videocam_outlined, color:  Colors.white, size: 35.0),
  //                           shape: CircleBorder(),
  //                           elevation: 2.0,
  //                           fillColor: Colors.green,
  //                           padding: const EdgeInsets.all(15.0)),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
