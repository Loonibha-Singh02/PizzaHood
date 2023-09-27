import 'package:flutter/material.dart';
import '../../../PopularMenu/cusPopularAppBar.dart';

class MeatLoverPage extends StatefulWidget{
  const MeatLoverPage({super.key});

  @override
  State<MeatLoverPage> createState() => _MeatLoverPage();
}

class _MeatLoverPage extends State<MeatLoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFEEE1),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: Custom_desp(
          ImagePath: AssetImage("assets/images/meat_lover.jpg"),
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
