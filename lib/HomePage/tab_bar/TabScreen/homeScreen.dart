import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_hood/HomePage/Menu/NonVegMenu/nonVegPizza/Tanno.dart';

import '../../Menu/custom_horizontal_list.dart';
import '../../Menu/NonVegMenu/nonVegPizza/bacon.dart';
import '../../Menu/SpecialMenu/specialPizza/meat_lover.dart';
import '../../Menu/NonVegMenu/non_veg_menu.dart';
import '../../Menu/SpecialMenu/special.dart';
import '../../Menu/VegMenu/veg_menu.dart';
import '../../PopularMenu/custom_popular_menu.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
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
                  ),

                  const SizedBox(height: 50),

                  SizedBox(
                    width: 100,
                    height: 25,
                    child: Text("OUR MENU",
                      style: GoogleFonts.josefinSans(
                        fontSize:15,
                        color: const Color(0xE2303334),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const CustomHorizontalList(
                    items: [
                      CustomHorizontalListItem(
                        text: 'Veg',
                        destination: VegPage() ,
                      ),
                      CustomHorizontalListItem(
                        text: 'Non-veg',
                        destination: NonVegPage(),
                      ),
                      CustomHorizontalListItem(
                        text: 'Special',
                        destination:  SpecialPage() ,
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OUR POPULAR PIZZA",
                        style: GoogleFonts.josefinSans(
                          fontSize: 15,
                          color: const Color(0xE2303334),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const CustomHorizontalListView(
                        items: [
                          CustomListViewItem(
                            title: 'Bacon',
                            imagePath: 'assets/images/bacon.jpg',
                            cost: 500,
                            destination: Bacon(), // Define another destination page
                          ),
                          CustomListViewItem(
                            title: 'Chicken Pollo',
                            imagePath: 'assets/images/tanno_pizza.jpg',
                            cost: 500,
                            destination: Tanno(), // Define your destination page
                          ),
                          CustomListViewItem(
                            title: 'Meat Lover',
                            imagePath: 'assets/images/meat_lover.jpg',
                            cost: 580,
                            destination: MeatLoverPage(), // Define another destination page
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 80,),
                ],
              )
          ),
        ],
      ),
    );
  }
}
