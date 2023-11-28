import 'package:flutter/material.dart';
import 'package:pizza_hood/HomePage/tab_bar/TabScreen/uploadImage.dart';
import 'package:pizza_hood/firebase/firebase_auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../welcome.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? userId = FirebaseAuth.instance.currentUser;

  // Function to handle logout
  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 170), // Adjust the space for the image
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Users")
                        .where("userId", isEqualTo: userId?.uid)
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return Text("No data available");
                      }
                      if (snapshot != null && snapshot.data != null) {
                        var fullname = snapshot.data!.docs[0]['Full name'];
                        var email = snapshot.data!.docs[0]['Email'];
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.only(bottom: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    fullname,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    email,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black38
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 80),
                            ListTile(
                              title: Text(
                                'About',
                                style: TextStyle(fontSize: 18),
                              ),
                              leading: Icon(Icons.info),
                              onTap: () {
                                // Add functionality for About here
                                // Implement your About screen navigation or action here
                              },
                            ),
                            Divider(thickness: 1.2,),
                            ListTile(
                              title: Text(
                                'Logout',
                                style: TextStyle(fontSize: 18),
                              ),
                              leading: Icon(Icons.exit_to_app),
                              onTap: () {
                                // Logout functionality
                                _logout();
                              },
                            ),
                          ],
                        );
                      }
                      return Container(child: Text("oookkkk"),);
                    },
                  ),
                ],
              ),
              Positioned(
                top: -50,
                left: 0,
                right: 0,
                child: UploadImage(), // Display UploadImage widget
              ),
            ],
          ),
        ),
      ),
    );
  }
}
