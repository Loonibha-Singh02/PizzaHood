import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NonVegScreen extends StatefulWidget {
  const NonVegScreen({Key? key}) : super(key: key);

  @override
  _NonVegScreenState createState() => _NonVegScreenState();
}

class _NonVegScreenState extends State<NonVegScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Non Veg Items',
          style: GoogleFonts.adamina(
            fontSize: 33,
            color: const Color(0xFF393E46),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black38), // Back button arrow color
        backgroundColor: const Color(0xFFFFEEE1), // App bar background color
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('NonVeg').snapshots(),
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
                height: 150, // Set the desired height for the card
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
