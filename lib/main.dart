import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pizza_hood/HomePage/HomePage.dart';
import 'package:pizza_hood/User_login/sign_in.dart';
import 'package:pizza_hood/User_login/sign_up.dart';
import 'package:pizza_hood/welcome.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 851),
        builder: (context , child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/', // Set the initial route
            routes: {
              '/': (context) => const WelcomePage(),
              '/Signin': (context) => const SignInPage(),
              '/Signup': (context) => const SignUpPage(),
              '/Home': (context) =>  HomePage(),
            },
          );
        }
    );
  }
}
