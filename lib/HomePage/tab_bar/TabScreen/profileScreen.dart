import 'package:flutter/material.dart';
import 'package:pizza_hood/HomePage/tab_bar/TabScreen/uploadImage.dart';
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
      MaterialPageRoute(builder: (context) => const WelcomePage()),
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
                  const SizedBox(height: 170), // Adjust the space for the image
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Users")
                        .where("userId", isEqualTo: userId?.uid)
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Something went wrong");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return const Text("No data available");
                      }
                      if (snapshot.data != null) {
                        var fullname = snapshot.data!.docs[0]['Full name'];
                        var email = snapshot.data!.docs[0]['Email'];
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.only(bottom: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    fullname,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    email,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black38
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 80),
                            ListTile(
                              title: const Text(
                                'About',
                                style: TextStyle(fontSize: 18),
                              ),
                              leading: const Icon(Icons.info),
                              onTap: () {
                                // Add functionality for About here
                                // Implement your About screen navigation or action here
                              },
                            ),
                            const Divider(thickness: 1.2,),
                            ListTile(
                              title: const Text(
                                'Logout',
                                style: TextStyle(fontSize: 18),
                              ),
                              leading: const Icon(Icons.exit_to_app),
                              onTap: () {
                                // Logout functionality
                                _logout();
                              },
                            ),
                          ],
                        );
                      }
                      return Container(child: const Text("oookkkk"),);
                    },
                  ),
                ],
              ),
              const Positioned(
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