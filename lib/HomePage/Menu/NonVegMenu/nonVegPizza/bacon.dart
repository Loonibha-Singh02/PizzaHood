import 'package:flutter/material.dart';
import '../../../PopularMenu/cusPopularAppBar.dart';

class Bacon extends StatefulWidget {
  const Bacon({super.key});

  @override
  State<Bacon> createState() => _BaconState();
}

class _BaconState extends State<Bacon> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: Custom_desp(
          ImagePath: AssetImage("assets/images/bacon.jpg"),
        ),
      ),
    );
  }
}
