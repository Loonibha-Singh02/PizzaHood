import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_hood/adminPanel/notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminNotificationScreen extends StatefulWidget {
  const AdminNotificationScreen({Key? key}) : super(key: key);

  @override
  _AdminNotificationScreenState createState() => _AdminNotificationScreenState();
}

class _AdminNotificationScreenState extends State<AdminNotificationScreen> {
  List<String> adminCartItems = [];

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getStringList('cartData') ?? [];
    setState(() {
      adminCartItems = cartData;
    });
  }

  Future<void> clearNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cartData');
    setState(() {
      adminCartItems = [];
    });
  }

  void handleOrderAccepted(int index) {
    String message = 'Order Accepted for: ${adminCartItems[index]}';
    Provider.of<NotificationProvider>(context, listen: false).sendMessage(message);
  }

  void handleOrderReady(int index) {
    String message = 'Order Ready for: ${adminCartItems[index]}';
    Provider.of<NotificationProvider>(context, listen: false).sendMessage(message);
  }

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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Clear Notifications?"),
                    content: const Text("Do you want to clear all notifications?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          clearNotifications();
                          Navigator.of(context).pop();
                        },
                        child: const Text("Clear"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.clear,
            color: Colors.black38,),
          ),
        ],
      ),
      body: adminCartItems.isEmpty
          ? const Center(child: Text('No notification available.'))
          : ListView.builder(
        itemCount: adminCartItems.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notification ${index + 1}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  adminCartItems[index],
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        handleOrderAccepted(index);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black38,
                      ),
                      child: const Text('Order Accepted'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        handleOrderReady(index);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black38,
                      ),
                      child: const Text('Order Ready'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}