import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  List<String> _messages = [];

  List<String> get messages => _messages;

  void sendMessage(String message) {
    _messages.add(message);
    notifyListeners();
  }

  void clearNotifications() {
    _messages.clear();
    notifyListeners();
  }
}
