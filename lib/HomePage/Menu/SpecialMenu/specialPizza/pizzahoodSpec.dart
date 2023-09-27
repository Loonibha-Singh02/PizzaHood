import 'package:flutter/material.dart';
import '../../../PopularMenu/cusPopularAppBar.dart';

class PizzahoodSpecialPage extends StatefulWidget{
  const PizzahoodSpecialPage({super.key});

  @override
  State<PizzahoodSpecialPage> createState() => _PizzahoodSpecialPage();
}

class _PizzahoodSpecialPage extends State<PizzahoodSpecialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFEEE1),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: Custom_desp(
            ImagePath: AssetImage("assets/images/Pizzahood_special.jpg"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child:  const Stack(
                  children: [
                    Column(
                      children: [
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
