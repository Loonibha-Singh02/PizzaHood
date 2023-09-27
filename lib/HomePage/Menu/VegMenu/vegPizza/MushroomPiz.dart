import 'package:flutter/material.dart';

import '../../../PopularMenu/cusPopularAppBar.dart';

class MushroomPage extends StatefulWidget {
  const MushroomPage({super.key});

  @override
  State<MushroomPage> createState() => _MushroomPageState();
}

class _MushroomPageState extends State<MushroomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: Custom_desp(
          ImagePath: AssetImage("assets/images/Mushroom-Pizza.jpg"),
        ),
      ),
    );;
  }
}
