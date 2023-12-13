import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class CaloriesPage extends StatefulWidget {
  @override
  _CaloriesPageState createState() => _CaloriesPageState();
}

class _CaloriesPageState extends State<CaloriesPage> {
  final TextEditingController searchController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> foodItems = [];
  List<Map<String, dynamic>> filteredFoodItems = [];

  @override
  void initState() {
    super.initState();
    fetchFoodData();
  }

  void fetchFoodData() async {
    final QuerySnapshot nonVegSnapshot =
    await firestore.collection('NonVeg').get();
    final QuerySnapshot vegSnapshot = await firestore.collection('Veg_Pizza').get();
    final QuerySnapshot specialSnapshot =
    await firestore.collection('Special_Pizza').get();

    setState(() {
      foodItems.addAll(
        nonVegSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>),
      );
      foodItems.addAll(
        vegSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>),
      );
      foodItems.addAll(
        specialSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>),
      );

      filteredFoodItems = List.from(foodItems); // Initially copy all food items
    });
  }

  void filterFoods(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredFoodItems = foodItems.where((food) {
          final title = food['title'].toString().toLowerCase();
          return title.contains(query.toLowerCase());
        }).toList();
      } else {
        filteredFoodItems = List.from(foodItems); // Show all food items
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFFEEE1),
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text('Search',
            style: GoogleFonts.labrada(
              fontSize: 33,
              color: const Color(0xFF393E46),
              // fontWeight: FontWeight.bold,
            ),),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,
            color: Colors.black26,),
            onPressed: () async {
              final String? selected = await showSearch(
                context: context,
                delegate: FoodSearchDelegate(
                  foodItems.map((item) => item['title'].toString()).toList(),
                ),
              );

              if (selected != null && selected.isNotEmpty) {
                filterFoods(selected);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFoodItems.length,
                itemBuilder: (context, index) {
                  final foodItem = filteredFoodItems[index];
                  return ListTile(
                    title: Text(foodItem['title'].toString()),
                    subtitle: Text('Price: ${foodItem['priceMedium']}'),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class FoodSearchDelegate extends SearchDelegate<String> {
  final List<String> foodTitles;

  FoodSearchDelegate(this.foodTitles);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? foodTitles
        : foodTitles
        .where((food) => food.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}
