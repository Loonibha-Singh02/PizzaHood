import 'package:flutter/material.dart';
import '../cusAppBarMenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../custom_Listview.dart';


class NonVegPage extends StatefulWidget {
  const NonVegPage({Key? key}) : super(key: key);

  @override
  State<NonVegPage> createState() => _NonVegPageState();
}

class _NonVegPageState extends State<NonVegPage> {
  final _NonVegStream = FirebaseFirestore.instance.collection('NonVeg').snapshots();

  // Define the itemPageMap here or wherever it makes sense in your code
  // final Map<String, Widget> itemPageMap = {
  //   'Bacon' : Bacon(),
  //   'Tanno' : Tanno(),
  //   // Add mappings for other items here
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: 'NonVeg pizza',
        ),
      ),
      body: StreamBuilder(
        stream: _NonVegStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Connection error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }
          var docs = snapshot.data!.docs; 
          List<Map<String, dynamic>> documentDataList = docs.map((doc) => doc.data()).toList();
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
