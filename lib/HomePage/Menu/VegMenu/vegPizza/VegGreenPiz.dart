import 'package:flutter/material.dart';

import '../../../PopularMenu/cusPopularAppBar.dart';

class VegGreenerPage extends StatefulWidget {
  const VegGreenerPage({super.key});

  @override
  State<VegGreenerPage> createState() => _VegGreenerPageState();
}

class _VegGreenerPageState extends State<VegGreenerPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFEEE1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: Custom_desp(
          ImagePath: AssetImage("assets/images/vegin_greener.jpg"),
        ),
      ),
    );
  }
}
