import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../cusAppBarMenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../custom_Listview.dart';

class VegPage extends StatefulWidget {
  const VegPage({Key? key});

  @override
  State<VegPage> createState() => _VegPageState();
}

class _VegPageState extends State<VegPage> {
  final _vegStream = FirebaseFirestore.instance.collection('Veg_Pizza').snapshots();

  // Define the itemPageMap here or wherever it makes sense in your code
  // final Map<String, Widget> itemPageMap = {
  //   'Mushroom': MushroomPage(),
  //   'Margherita' : MargheritaPage(),
  //   'Vegin Greener': VegGreenerPage()
  //   // Add mappings for other items here
  // };

  @override
  Widget build(BuildContext context)   {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: 'Veg pizza',
        ),
      ),
      body: StreamBuilder(
        stream: _vegStream,
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
