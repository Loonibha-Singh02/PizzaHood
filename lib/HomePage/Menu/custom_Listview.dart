import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_hood/HomePage/Menu/customSizeButton.dart';

import '../tab_bar/TabScreen/cartScreen.dart';

class CusListview extends StatefulWidget {
  final List<Map<String, dynamic>> documents; // Pass the Firestore documents as a parameter
  // final void Function(String) onItemClick;

  const CusListview({
    Key? key,
    required this.documents,
    // required this.onItemClick,
  }) : super(key: key);

  @override
  _CusListviewState createState() => _CusListviewState();
}

class _CusListviewState extends State<CusListview> {
  List<bool> isSelectedListMedium = List.generate(10, (index) => false);
  List<bool> isSelectedListLarge = List.generate(10, (index) => false);
  List<int> quantityCounts = List.generate(10, (index) => 0);

  //decrement quantity
  void decrementQuantity(int index){
    setState(() {
      if(quantityCounts[index]> 0){
        quantityCounts[index]--;
      }
    });
  }

  //increment quantity
  void incrementQuantity(int index){
    setState(() {
      quantityCounts[index]++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: widget.documents.length,
        itemBuilder: (BuildContext context, int index) {
          final document = widget.documents[index];
          final title = document['title'] as String;
          final priceMedium = (document['priceMedium'] as num).toDouble();
          final priceLarge = (document['priceLarge'] as num).toDouble();
          final imageUrl = document['image'] as String;
          final description = document['description'] as String;

          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Stack(
              children: [
                Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:  const Color(0xFFFFD7BD),
                    width: 2, // Border width
                  ),
                  color: const Color(0xFFFFD7BD),
                  borderRadius: BorderRadius.circular(8), // Optional: Add rounded corners
                ),

                // child: InkWell(
                //   onTap: () {
                //     // Trigger the callback to handle item tap with the item identifier
                //     widget.onItemClick(title); // Pass the selected item's title
                //   },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 200,// Width of the image container
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Opacity(
                            opacity: 0.85,
                            child: Image.network(
                                imageUrl, // Load the image from the imageUrl field in Firestore
                                fit: BoxFit.cover, // Set the fit mode (e.g., BoxFit.cover, BoxFit.fill)
                              )
                            ),
                          ),
                        ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: GoogleFonts.abrilFatface(
                                  fontSize: 16,
                                  color: const Color(0xE2303334),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height:3),

                              Container(
                                height: 30,
                                child: Text(description,
                                  style: const TextStyle(
                                      color:  Color(0xBB53575D),
                                      fontSize: 11
                                  ),
                                ),
                              ),
                              const SizedBox(height:10),

                              //size medium and large
                              Row(
                                children: [
                                  CustomSizeButton(
                                    text: 'Medium',
                                    price: isSelectedListMedium[index] ? priceMedium : 0.0,
                                    isSelected: isSelectedListMedium[index],
                                    onPressed: () {
                                      setState(() {
                                        isSelectedListMedium[index] = !isSelectedListMedium[index];
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 15),

                                  CustomSizeButton(
                                    text: 'Large',
                                    price: isSelectedListLarge[index] ? priceLarge : 0.0,
                                    isSelected: isSelectedListLarge[index],
                                    onPressed: () {
                                      setState(() {
                                        isSelectedListLarge[index] = !isSelectedListLarge[index];
                                      });
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //quantity add and remove
                Positioned(
                  bottom: 35,
                  left: 115,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          icon: const Icon(Icons.remove,
                            color: Color(0xBB53575D),
                            size: 15,
                          ),
                          onPressed: () => decrementQuantity(index)
                      ),
                      SizedBox(
                        width: 20,
                        child: Center(
                          child: Text(quantityCounts[index].toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xBB53575D),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: const Icon(Icons.add,
                            color: Color(0xBB53575D),
                            size: 15,
                          ),
                          onPressed: () => incrementQuantity(index),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom:0,
                    right: 10,
                    child: Container(
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Add to cart',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xBB53575D),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 12,
                          )
                        ],
                      ),
                    )
                )
            ]
            ),
          );
        },
      ),
    );
  }
}
