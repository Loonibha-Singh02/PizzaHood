import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_hood/adminPanel/adminLogins/adWelpg.dart';

import 'adminPanel/adminLogins/adminSignup.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                      top: 250.h,
                      right: 20.w,
                      child: Container(
                        width: 350.w,
                        height: 200.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/logo1re.png"),
                            )
                        ),
                      )
                  ),
                  Positioned(
                      top: 430.h,
                      right: 30.w,
                      child: Text(
                        "Find your perfect place to eat, meet and enjoy.",
                        style: GoogleFonts.aBeeZee(
                            fontSize:15.sp,
                          color: const Color(0x69544D4D),
                        ),
                      )
                  ),

                  Positioned(
                      top:500.h,
                      right:75.w,
                      child: SizedBox(
                        width:240.w,
                        height:150.w,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/Signin');
                              },
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: const Color(0xFFFCB07E)),
                                elevation: 0,
                                backgroundColor: const Color(0xFFFCB07E),
                                minimumSize:  Size(340.w, 45.h),
                                shape:
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text("Sign in"),
                            ),

                            SizedBox(height: 5.h),

                            OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Signup');
                              },
                              style: OutlinedButton.styleFrom(
                                elevation:0,
                                minimumSize:  Size(350.w, 45.h),
                                textStyle: TextStyle(fontSize: 15.sp),
                                shape:
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                side: const BorderSide(width: 1.3, color: Color(0xFFFCB07E)), // Set the border properties
                              ),
                              child: const Text('Sign up',
                                style: TextStyle(
                                    color: Color(0xFFFCB07E)
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                  Positioned(
                    bottom: 50,
                    right: 40,
                    child: TextButton(
                      onPressed: () {
                        // Navigate to the admin login page when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdminWelcomePage()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Admin",
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              color: const Color(0x69544D4D),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 18, // Adjust the size as needed
                            color: const Color(0x69544D4D), // Adjust the color if necessary
                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
