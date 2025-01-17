import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialScreen extends StatefulWidget {
  const SpecialScreen({super.key});

  @override
  _SpecialScreenState createState() => _SpecialScreenState();
}

class _SpecialScreenState extends State<SpecialScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceLargeController = TextEditingController();
  final TextEditingController _priceMediumController = TextEditingController();

  Future<void> updateSpecialPizza(String itemId) async {
    final CollectionReference specialPizzaItems =
    FirebaseFirestore.instance.collection('Special_Pizza');

    int priceLarge = int.parse(_priceLargeController.text);
    int priceMedium = int.parse(_priceMediumController.text);

    await specialPizzaItems.doc(itemId).update({
      'title': _titleController.text,
      'description': _descriptionController.text,
      'priceLarge': priceLarge, // Update integer value
      'priceMedium': priceMedium, // Update integer value
    });

    _titleController.clear();
    _descriptionController.clear();
    _priceLargeController.clear();
    _priceMediumController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      appBar: AppBar(
        title: Text(
          'Special Items',
          style: GoogleFonts.adamina(
            fontSize: 33,
            color: const Color(0xFF393E46),
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black38),
        backgroundColor: const Color(0xFFFFEEE1),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Special_Pizza').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(20),
            children: snapshot.data!.docs.map((doc) {
              return SizedBox(
                height: 450,
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  color: const Color(0xFF393E46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title: ${doc['title']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Description: ${doc['description']}',
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Price Large: Rs ${doc['priceLarge']}',
                          style: const TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          'Price Medium: Rs ${doc['priceMedium']}',
                          style: const TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: 'New Title',
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'New Description',
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _priceLargeController,
                          decoration: const InputDecoration(
                            labelText: 'New Price Large',
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _priceMediumController,
                          decoration: const InputDecoration(
                            labelText: 'New Price Medium',
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            updateSpecialPizza(doc.id);
                          },
                          child: const Text('Update'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
