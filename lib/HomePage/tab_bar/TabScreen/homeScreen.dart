import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_hood/HomePage/Menu/NonVegMenu/nonVegPizza/Tanno.dart';
import 'package:pizza_hood/HomePage/tab_bar/TabScreen/search.dart';

import '../../Menu/custom_horizontal_list.dart';
import '../../Menu/NonVegMenu/nonVegPizza/bacon.dart';
import '../../Menu/SpecialMenu/specialPizza/meat_lover.dart';
import '../../Menu/NonVegMenu/non_veg_menu.dart';
import '../../Menu/SpecialMenu/special.dart';
import '../../Menu/VegMenu/veg_menu.dart';
import '../../PopularMenu/custom_popular_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60, top: 30),
            child: Text(
              "Find your perfect place to eat, meet and enjoy.",
              style: GoogleFonts.aBeeZee(
                fontSize:15,
                color: const Color(0x69544D4D),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              width: 375,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFFFD7BD),
                  width: 1,
                ),
                color: Color(0xFFFFD7BD),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.search,
                      color: Color(0x69544D4D),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CaloriesPage()),
                      );
                    },
                    child: Text(
                      'Search...',
                      style: GoogleFonts.josefinSans(
                        fontSize: 20,
                        color: Color(0x69544D4D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 40),

                  SizedBox(
                    width: 150,
                    height: 25,
                    child: Text("OUR MENU",
                      style: GoogleFonts.josefinSans(
                        fontSize:18,
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

                  const SizedBox(height: 50),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OUR POPULAR PIZZA",
                        style: GoogleFonts.josefinSans(
                          fontSize: 18,
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
                            destination: Bacon(),
                            description: 'Nepotilian sauce, bacon, cheese,and dry basil',// Define another destination page
                          ),
                          CustomListViewItem(
                            title: 'Chicken Pollo',
                            imagePath: 'assets/images/tanno_pizza.jpg',
                            cost: 500,
                            destination: Tanno(),
                            description: 'Nepotilian sauce, chicken, cheese,and dry basil',/// Define your destination page
                          ),
                          CustomListViewItem(
                            title: 'Meat Lover',
                            imagePath: 'assets/images/meat_lover.jpg',
                            cost: 580,
                            destination: MeatLoverPage(),
                            description: 'Nepotilian sauce, bacon, chicken, salami, cheese,and dry basil',/// Define another destination page
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 80,),
                ],
              )
          ),
        ],
      ),
    );
  }
}
