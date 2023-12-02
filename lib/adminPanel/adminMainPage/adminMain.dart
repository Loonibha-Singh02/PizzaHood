import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({super.key});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
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
    );
  }
}
