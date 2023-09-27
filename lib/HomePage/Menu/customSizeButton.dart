import 'package:flutter/material.dart';

class CustomSizeButton extends StatelessWidget {
  final String text;
  final double price;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomSizeButton({
    super.key,
    required this.text,
    required this.price,
    required this.isSelected,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 13),
          ),
          if (isSelected)
            SizedBox(height: 5),
          if (isSelected)
            Text(
              '\Rs ${price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 10),
            )
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFCB07E),
        minimumSize: Size(80, 37),
        elevation: 0,
      ),
    );
  }
}


