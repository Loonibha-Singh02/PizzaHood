import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Color labelColor; // Color for the label text
  final Color hintColor;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  // final Color textColor; // Add this parameter

  const MyTextField({ Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.validator,
    required this.suffixIcon,
    this.obscureText = true,
    required this.labelColor,
    required this.hintColor,
    // required this.textColor, // Initialize in constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      // style: TextStyle(color: textColor), // Set the text color
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: TextStyle(color: labelColor),
        hintStyle: TextStyle(color: hintColor),
        labelText: labelText,
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color:  Color(0xFFFCB07E),width: 2), // Set the border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color:  Color(0xFFFCB07E),width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color:Color(0xFFFCB07E),width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color:Color(0xFFFCB07E),width: 2),
        ),
      ),
    );
  }
}


