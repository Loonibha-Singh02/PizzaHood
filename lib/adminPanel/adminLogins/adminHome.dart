import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_hood/adminPanel/adminLogins/screensAdmin/NonVeg.dart';
import 'package:pizza_hood/adminPanel/adminLogins/screensAdmin/User.dart';
import 'package:pizza_hood/adminPanel/adminLogins/screensAdmin/Veg.dart';
import 'package:pizza_hood/adminPanel/adminLogins/screensAdmin/special.dart';
import 'package:pizza_hood/adminPanel/adminNotification.dart';

import '../../welcome.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  void _logout() {
    // Navigate to the welcome screen or login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const WelcomePage()), // Replace WelcomeScreen with your welcome/login screen
          (route) => false, // Clear all routes on the stack
    );
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
          padding: const EdgeInsets.only(left: 70),
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
        iconTheme: const IconThemeData(size: 20),
        leading: IconButton(
          icon: const Icon(Icons.notifications_on_rounded,
              color:Color(0x69544D4D)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AdminNotificationScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout,
                color:Color(0x69544D4D)),
            onPressed: _logout,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        width: 500,
        height: 300,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UsersScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: const Text('Users'),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NonVegScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: const Text('Non Veg'),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VegScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: const Text('Veg'),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SpecialScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: const Text('Special'),
            ),
          ],
        ),
      ),
    );
  }
}
