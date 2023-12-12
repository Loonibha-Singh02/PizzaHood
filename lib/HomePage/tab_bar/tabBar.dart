import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class CustomBTab extends StatefulWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const CustomBTab({super.key, required this.currentIndex, required this.onTap});

  @override
  _CustomBTabState createState() => _CustomBTabState();
}

class _CustomBTabState extends State<CustomBTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        color: Color(0xFFFFD7BD),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: GNav(
            selectedIndex: widget.currentIndex,
            onTabChange: (index) {
              widget.onTap(index);
            },
            haptic: true,
            tabBorderRadius: 22,
            curve: Curves.decelerate,
            duration: const Duration(milliseconds: 500),
            gap:3,
            activeColor: const Color(0xFFFFEEE1),
            iconSize: 24,
            tabBackgroundColor: const Color(0xFF393E46),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.shoppingCart,
                text: 'Cart',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
