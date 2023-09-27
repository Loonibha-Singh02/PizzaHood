import 'package:flutter/material.dart';
import 'package:pizza_hood/HomePage/Menu/SpecialMenu/specialPizza/pizzahoodSpec.dart';
import 'specialPizza/meat_lover.dart';
import '../cusAppBarMenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../custom_Listview.dart';


class SpecialPage extends StatefulWidget {
  const SpecialPage({Key? key});

  @override
  State<SpecialPage> createState() => _SpecialPageState();
}

class _SpecialPageState extends State<SpecialPage> {
  final _SpecialStream = FirebaseFirestore.instance.collection('Special_Pizza').snapshots();


  // Define the itemPageMap here or wherever it makes sense in your code
  // final Map<String, Widget> itemPageMap = {
  //   'Meat Lover': MeatLoverPage(),
  //   'Pizzahood Special': PizzahoodSpecialPage(),
  //   // Add mappings for other items here
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: 'Special pizza',
        ),
      ),
      body: StreamBuilder(
        stream: _SpecialStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Connection error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }
          var docs = snapshot.data!.docs;
          List<Map<String, dynamic>> documentDataList = docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
          return CusListview(
            documents: documentDataList,
            // onItemClick: (selectedItem) {
            //   // Check if the selected item is in the itemPageMap
            //   if (itemPageMap.containsKey(selectedItem)) {
            //     // Navigate to the corresponding page
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => itemPageMap[selectedItem]!,
            //       ),
            //     );
            //   } else {
            //     // Handle the case where the selected item doesn't have a mapping
            //     showDialog(
            //       context: context,
            //       builder: (context) {
            //         return AlertDialog(
            //           title: Text('Item Not Found'),
            //           content: Text('No page found for $selectedItem'),
            //           actions: [
            //             TextButton(
            //               onPressed: () {
            //                 Navigator.pop(context);
            //               },
            //               child: Text('OK'),
            //             ),
            //           ],
            //         );
            //       },
            //     );
            //   }
            // },
          );
        },
      ),
    );
  }
}
