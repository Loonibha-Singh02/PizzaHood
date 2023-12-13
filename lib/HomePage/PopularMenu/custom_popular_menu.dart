import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHorizontalListView extends StatelessWidget {
  final List<CustomListViewItem> items;

  const CustomHorizontalListView({Key? key,
    required this.items
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320, // Set the desired height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to a different page when clicked
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => items[index].destination,
                ),
              );
            },
            child: items[index],
          );
        },
      ),
    );
  }
}
class CustomListViewItem extends StatelessWidget {
  final String imagePath;
  final double cost;
  final Widget destination;
  final String title;
  final String description;

  const CustomListViewItem({
    Key? key,
    required this.imagePath,
    required this.cost,
    required this.destination,
    required this.title, required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFFFD7BD),
        border: Border.all(
          color: Colors.black12,// Set the border width
        ),// Customize the background color
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Opacity(
             opacity: 0.85,
             child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: 180,
                    width: 200,
             ),
           ), // Customize image size
            const SizedBox(height:8),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(title,
                style: GoogleFonts.josefinSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 40,
                child: Text(description,
                  style: GoogleFonts.josefinSans(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text('Rs $cost', style: const TextStyle()),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

