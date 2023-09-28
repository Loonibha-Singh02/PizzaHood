import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pizza_hood/firebase/firebaseSearch.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  final FirebaseSearch firebaseSearch = FirebaseSearch();
  List<DocumentSnapshot> searchResults = [];

  @override
  void initState() {
    searchController.addListener(() {
      searchFirebase(searchController.text);
    });
    super.initState();
  }

  void searchFirebase(String searchText) {
    if (searchText.isNotEmpty) {
      firebaseSearch.searchFirestore(searchText).then((results) {
        if (mounted) {
          setState(() {
            searchResults = results;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // This makes children expand to full width
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFFFD7BD),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Color(0xFFFFD7BD)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Color(0xFFFFD7BD)),
                ),
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Color(0xBB53575D),
                ),
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: Color(0xBB53575D),
                ),
              ),
            ),
            const SizedBox(height: 20), // Add vertical spacing
            Text(
              'Search Results:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final document = searchResults[index];
                  return Card(
                    child: ListTile(
                      title: Text(document['name']),
                      subtitle: Text(document['category']),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
