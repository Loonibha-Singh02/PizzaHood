import 'package:firebase_messaging/firebase_messaging.dart';

class AdminFCMTokenService {
  static Future<String?> getAdminFCMToken() async {
    try {
      FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
      return await firebaseMessaging.getToken();
    } catch (e) {
      print('Error getting admin FCM token: $e');
      return null;
    }
  }
}
