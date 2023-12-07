import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app_settings/app_settings.dart';

class NotificationService{

  FirebaseMessaging messaging = FirebaseMessaging.instance;

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

  void firebaseInit(){
    FirebaseMessaging.onMessage.listen((message) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
    });
  }

  Future<String> getDeviceToken() async{
    String? token = await messaging.getToken();
    return token!;
  }

}