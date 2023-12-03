import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_hood/adminPanel/adminLogins/screensAdmin/NonVeg.dart';
import 'package:pizza_hood/adminPanel/adminLogins/screensAdmin/User.dart';
import 'package:pizza_hood/adminPanel/adminLogins/screensAdmin/Veg.dart';
import 'package:pizza_hood/adminPanel/adminLogins/screensAdmin/special.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
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
        iconTheme: const IconThemeData(size: 20),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_on_rounded,
                color:Color(0x69544D4D)),
            onPressed: () {
              // Add your action here
            },
          ),],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        width: 500,
        height: 300,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsersScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: Text('Users'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NonVegScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: Text('Non Veg'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VegScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: Text('Veg'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpecialScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: Text('Special'),
            ),

          ],
        ),
      ),
    );
  }
}
