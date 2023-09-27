import 'package:flutter/material.dart';

class CustomHorizontalList extends StatefulWidget {
  final List<CustomHorizontalListItem> items;

  const CustomHorizontalList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  _CustomHorizontalListState createState() => _CustomHorizontalListState();
}

class _CustomHorizontalListState extends State<CustomHorizontalList> {
  int selectedIndex = 0; // Track the selected index, initially 0

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // Update the selected index
              });

              // Navigate to the selected item's destination
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => item.destination,
                ),
              );
            },
            child: CustomHorizontalListItem(
              text: item.text,
              destination: item.destination,
              selected: index == selectedIndex, // Check if this item is selected
            ),
          );
        },
      ),
    );
  }
}

class CustomHorizontalListItem extends StatelessWidget {
  final String text;
  final Widget destination;
  final bool selected; // Add this property

  const CustomHorizontalListItem({
    Key? key,
    required this.text,
    required this.destination,
    this.selected = false, // Default to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selected ?  const Color(0xFFFCB07E) : const Color(0xFFFFD7BD),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: selected ? const Color(0xFF393E46) : const Color(0xBB53575D),
          ),
        ),
      ),
    );
  }
}
