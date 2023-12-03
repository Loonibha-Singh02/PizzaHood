import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pizza_hood/HomePage/tab_bar/TabScreen/uploadImage.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:pizza_hood/HomePage/HomePage.dart';
import 'package:pizza_hood/User_login/sign_in.dart';
import 'package:pizza_hood/User_login/sign_up.dart';
import 'package:pizza_hood/welcome.dart';
import 'HomePage/Menu/cartModel.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      builder: (context, child) {
        return MultiProvider( // Wrap your app with MultiProvider
          providers: [
            ChangeNotifierProvider(create: (_) => CartModel()), // Provide CartModel
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/', // Set the initial route
            routes: {
              '/': (context) => const WelcomePage(),
              '/Signin': (context) => const SignInPage(),
              '/Signup': (context) => const SignUpPage(),
              '/Home': (context) => HomePage(),
            },
          ),
        );
      },
    );
  }
}
