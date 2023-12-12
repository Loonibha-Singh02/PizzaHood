import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, 
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFEEE1),
      elevation: 0, // Set the default background color
      leading:  IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color(0x69544D4D),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      iconTheme: const IconThemeData(size: 20),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_on_rounded,
            color: Color(0x69544D4D),
          ),
          onPressed: () {
            // Add your action here
          },
        ),
      ],
      title: Center(
        child: Text(
            title,
            style: GoogleFonts.abrilFatface(
              fontSize:30,
              color: const Color(0xE2303334),
              fontWeight: FontWeight.bold,
            ), // Set the default text color
          ),
      ),
    );
  }
}
