import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> updateUser(String userId) async {
    final CollectionReference users = FirebaseFirestore.instance.collection('Users');

    await users.doc(userId).update({
      'Full name': _nameController.text,
      'Email': _emailController.text,
    });

    // Reset text field colors to black
    _nameController.text = '';
    _nameController..text = _nameController.text;
    _nameController..selection = TextSelection.collapsed(offset: _nameController.text.length);

    _emailController.text = '';
    _emailController..text = _emailController.text;
    _emailController..selection = TextSelection.collapsed(offset: _emailController.text.length);
  }

  Future<void> deleteUser(String userId) async {
    final CollectionReference users = FirebaseFirestore.instance.collection('Users');

    await users.doc(userId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE1),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black38),
        backgroundColor: const Color(0xFFFFEEE1),
        title: Text(
          'Users',
          style: GoogleFonts.adamina(
            fontSize: 33,
            color: const Color(0xFF393E46),
          ),
        ),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(20),
            children: snapshot.data!.docs.map((doc) {
              return SizedBox(
                height: 200,
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  color: const Color(0xFF393E46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          doc['Full name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          doc['Email'],
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  labelText: 'New Name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  labelText: 'New Email',
                                  labelStyle: TextStyle(color: Colors.white),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                updateUser(doc.id);
                              },
                              child: const Text('Update'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                deleteUser(doc.id);
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: UsersScreen(),
  ));
}
