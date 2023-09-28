import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseSearch {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> searchFirestore(String searchText) async {
    final List<QuerySnapshot> results = await Future.wait([
      firestore
          .collection('veg')
          .where('name', isGreaterThanOrEqualTo: searchText)
          .where('name', isLessThanOrEqualTo: searchText + '\uf8ff')
          .get(),
      firestore
          .collection('non veg')
          .where('name', isGreaterThanOrEqualTo: searchText)
          .where('name', isLessThanOrEqualTo: searchText + '\uf8ff')
          .get(),
      firestore
          .collection('special')
          .where('name', isGreaterThanOrEqualTo: searchText)
          .where('name', isLessThanOrEqualTo: searchText + '\uf8ff')
          .get(),
    ]);

    List<DocumentSnapshot> documents = [];

    for (var result in results) {
      documents.addAll(result.docs);
    }

    return documents;
  }
}