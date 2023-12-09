import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../adminPanel/notifier.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({Key? key});

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFEEE1),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 120),
          child: RichText(
            text: TextSpan(
              text: "Pizza",
              style: GoogleFonts.pacifico(
                fontSize: 33,
                color: const Color(0xFF393E46),
                // fontWeight: FontWeight.bold,
              ),
              children: const <TextSpan>[
                TextSpan(
                  text: 'hood',
                  style: TextStyle(
                    color: Color(0xFFFCB07E),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<NotificationProvider>(context, listen: false).clearNotifications();
            },
            icon: Icon(Icons.clear,
            color: Colors.black54,),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Consumer<NotificationProvider>(
          builder: (context, notificationProvider, _) {
            if (notificationProvider.messages.isEmpty) {
              return Center(
                child: Text(
                  'No notifications available.',
                  style: TextStyle(fontSize: 18.0),
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: notificationProvider.messages.asMap().entries.map((entry) {
                  int index = entry.key;
                  String message = entry.value;
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notification ${index + 1}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          message,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
