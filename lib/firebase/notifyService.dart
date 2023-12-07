import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('User granted permission');
    }
    else if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('User granted provisional permission');
    }
    else{
      print('User did denied permission');
    }

  }

  void initLocalNotofication(BuildContext context, RemoteMessage message) async{
    var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: (payload){

      }
    );
  }

  void firebaseInit(){
    FirebaseMessaging.onMessage.listen((message) {
      if(kDebugMode){
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
      }
        showNotification(message);
    });
  }

  Future<void> showNotification(RemoteMessage message) async{

    AndroidNotificationChannel channel = AndroidNotificationChannel(
    Random.secure().nextInt(100000).toString(),
        'High Importance Notifications',
        importance: Importance.max
    ); // AndroidNotificationChannel

    AndroidNotificationDetails androldNotificationdetalls = AndroidNotificationDetails(
    channel.id.toString(),
    channel.name.toString(),
    channelDescription: 'your channel describtion',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    DarwinNotificationDetails drawinNotificationDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androldNotificationdetalls,
      iOS: drawinNotificationDetails
    );

    Future.delayed(Duration.zero, (){
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails
      );
    });
  }

  Future<String> getDeviceToken() async{
    String? token = await messaging.getToken();
    return token!;
  }

}