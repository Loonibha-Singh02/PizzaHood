import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../firebase/firebaseSearch.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final FirebaseSearch firebaseSearch = FirebaseSearch();
  String searchText = '';
  List<String> searchResults = [];

  void performSearch(String query) async {
    List<String> results = await firebaseSearch.searchFirestore(query);
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 200,
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: CupertinoSearchTextField(
              backgroundColor: Color(0xFFFFD7BD),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
                performSearch(value);
              },
            ),
          ),
          if (searchResults.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final title = searchResults[index];
                  return ListTile(
                    title: Text(title),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
