import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 320,
      child: Padding(
        padding: EdgeInsets.only(top:25),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFFFD7BD),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color:Color(0xFFFFD7BD))
            ),
            hintText: 'Search...',
            hintStyle:TextStyle(
                color: Color(0xBB53575D)
            ),
            prefixIcon: Icon(Icons.search_outlined,
                color: Color(0xBB53575D)
            ),
          ),
        ),
      ),
    );
  }
}
