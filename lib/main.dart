import 'dart:async';

import 'package:eralogistic/app/notification.dart';
import 'package:eralogistic/app/routes/routes.dart';
import 'package:eralogistic/app/state/app_state.dart';
import 'package:eralogistic/app/state/feed_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Timer.periodic(const Duration(seconds: 5), (_) async {
  //   var newMessage = await getNewNotification();
  //   if (newMessage != null && newMessage != '') {
  //     flutterLocalNotificationsPlugin
  //         .show(
  //           newMessage.hashCode,
  //           'Новое уведомление',
  //           newMessage[0]['text'].toString(),
  //           const NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               'eralogistic',
  //               'com.akr4log.eralogistic',
  //               icon: 'mini_logo',
  //               priority: Priority.high,
  //             ),
  //           ),
  //         )
  //         .whenComplete(() => readNotifications());
  //   }
  // });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(create: (_) => AppState()),
        ChangeNotifierProvider<FeedServiceState>(
            create: (_) => FeedServiceState()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Inter',
        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.route(),
        onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
        initialRoute: "SplashPage",
      ),
    );
  }
}
