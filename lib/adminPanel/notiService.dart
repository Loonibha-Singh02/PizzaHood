import 'package:flutter/material.dart';

class NotificationModel extends ChangeNotifier {
  String _notificationMessage = '';

  String get notificationMessage => _notificationMessage;

  void setNotificationMessage(String message) {
    _notificationMessage = message;
    notifyListeners();
  }
}
