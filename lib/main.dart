
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/custom_dateTime_formate.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_controller.dart';
import 'package:package_delivery/Utils/Notification/firebase_notificatation_handler.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/initial_bindings.dart';
import 'package:timeago/timeago.dart' as timeago;
// bool? isLogin = false;
// Future getLogin() async {
//   isLogin = await Preference().readBool(Const.prefIsLoggedIn) ?? false;
//   debugPrint('getLogin => isLogin : $isLogin');
// }
FirebaseNotifications firebaseNotifications = FirebaseNotifications();
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
AndroidNotificationChannel? channel;

Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await Preference().saveBool(Const.prefNotificationRoutesSet, true);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    firebaseNotifications.setupFirebase();
  });

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin!.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel!);
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: false, sound: true);
  }
  runApp( const MyApp());
}

var navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      navigatorKey: navigatorKey,
      // initialBinding: InitialBinding(),
      //TODO : 21-01-2022 Milestone 1 Complete
      // initialRoute: isLogin! == true ? AppRoutes.dashboardScreen : AppRoutes.signInScreen,
      // initialRoute: AppRoutes.signInScreen,
      initialRoute: AppRoutes.splashScreen,
    );
  }
}


// class MyAppLogin extends StatelessWidget {
//   const MyAppLogin({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       getPages: AppRoutes.pages,
//       initialRoute: AppRoutes.signInScreen,//isLogin! == true ? AppRoutes.homeScreen : AppRoutes.signInScreen,
//     );
//   }
// }
//
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       getPages: AppRoutes.pages,
//       initialRoute: AppRoutes.homeScreen
//     );
//   }
// }
//
//
