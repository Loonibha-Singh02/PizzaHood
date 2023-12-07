import 'package:firebase_messaging/firebase_messaging.dart';

class AdminFCMTokenService {
  static Future<String?> getAdminFCMToken() async {
    try {
      FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
      return await _firebaseMessaging.getToken();
    } catch (e) {
      print('Error getting admin FCM token: $e');
      return null;
    }
  }
}
