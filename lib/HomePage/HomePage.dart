import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_hood/HomePage/notificationUser.dart';
import 'package:pizza_hood/HomePage/tab_bar/TabScreen/cartScreen.dart';
import 'package:pizza_hood/HomePage/tab_bar/TabScreen/favScreen.dart';
import 'package:pizza_hood/HomePage/tab_bar/TabScreen/homeScreen.dart';
import 'package:pizza_hood/HomePage/tab_bar/TabScreen/profileScreen.dart';
import 'package:pizza_hood/HomePage/tab_bar/tabBar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_handlePageChange);
  }

  void _handlePageChange() {
    setState(() {
      _currentIndex = _pageController.page!.round();
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_handlePageChange);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus =FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus){
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        bottomNavigationBar: CustomBTab(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
        ),
        backgroundColor: const Color(0xFFFFEEE1),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFEEE1),
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 120),
              child: RichText(
               text: TextSpan(
                text: "Pizza",
                style: GoogleFonts.pacifico(
                  fontSize: 33,
                  color: const Color(0xFF393E46),
                  // fontWeight: FontWeight.bold,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'hood',
                    style: TextStyle(
                      color: Color(0xFFFCB07E),
                    ),
                  ),
               ],
               ),
              ),
            ),
          iconTheme: const IconThemeData(size: 20),
          actions: [
            IconButton(
            icon: const Icon(Icons.notifications_on_rounded,
            color:Color(0x69544D4D)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>UserNotification()),
              );
            },
          ),],
        ),
        body: PageView(
          controller: _pageController,
          children: [
            HomeScreen(), // Pass the addToCart method to HomeScreen
            FavoritesScreen(), // Create this screen
            CartScreen(), // Pass the cartItems list to CartScreen
            ProfileScreen(), // Create this screen
          ],
        ),
      ),
    );
  }
}
