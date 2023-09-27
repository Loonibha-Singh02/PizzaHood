import 'package:flutter/material.dart';
import '../../../PopularMenu/cusPopularAppBar.dart';

class MargheritaPage extends StatefulWidget {
  const MargheritaPage({super.key});

  @override
  State<MargheritaPage> createState() => _MargheritaPageState();
}

class _MargheritaPageState extends State<MargheritaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: Custom_desp(
          ImagePath: AssetImage("assets/images/veg_margherita_pizza.jpg"),
        ),
      ),
    );
  }
}
