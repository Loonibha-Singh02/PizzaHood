import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VegScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veg Items',
          style: GoogleFonts.adamina(
            fontSize: 33,
            color: const Color(0xFF393E46),
            // fontWeight: FontWeight.bold,
          ),),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black38),
        backgroundColor: const Color(0xFFFFEEE1), // App bar background color
      ),
      backgroundColor: const Color(0xFFFFEEE1),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Veg_Pizza').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: EdgeInsets.all(20),
            children: snapshot.data!.docs.map((doc) {
              return Container(
                height: 150, // Set the desired height for the card
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  color: const Color(0xFF393E46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title: ${doc['title']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Description: ${doc['description']}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Price Large: Rs ${doc['priceLarge']}',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          'Price Medium: Rs ${doc['priceMedium']}',
                          style: TextStyle(fontSize: 14, color: Colors.white),
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
