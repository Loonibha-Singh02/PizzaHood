import 'package:flutter/material.dart';
import '../../../PopularMenu/cusPopularAppBar.dart';

class Tanno extends StatefulWidget {
  const Tanno({super.key});

  @override
  State<Tanno> createState() => _TannoState();
}

class _TannoState extends State<Tanno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: Custom_desp(
          ImagePath: AssetImage("assets/images/tanno_pizza.jpg"),
        ),
      ),
    );
  }
}
