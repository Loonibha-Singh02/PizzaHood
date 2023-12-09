import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    title: Text("Clear Notifications?"),
                    content: Text("Do you want to clear all notifications?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          clearNotifications();
                          Navigator.of(context).pop();
                        },
                        child: Text("Clear"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.clear,
            color: Colors.black38,),
          ),
        ],
      ),
      body: adminCartItems.isEmpty
          ? Center(child: Text('No notification available.'))
          : ListView.builder(
        itemCount: adminCartItems.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notification ${index + 1}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  adminCartItems[index],
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
