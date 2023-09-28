import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseSearch {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<String>> searchFirestore(String searchText) async {
    List<String> titles = [];

    final QuerySnapshot vegSnapshot = await firestore
        .collection('Veg_Pizza')
        .where('title', isGreaterThanOrEqualTo: searchText)
        .where('title', isLessThanOrEqualTo: searchText + '\uf8ff')
        .get();

    titles.addAll(vegSnapshot.docs.map((doc) => doc['title'] as String));

    final QuerySnapshot nonVegSnapshot = await firestore
        .collection('NonVeg')
        .where('title', isGreaterThanOrEqualTo: searchText)
        .where('title', isLessThanOrEqualTo: searchText + '\uf8ff')
        .get();

    titles.addAll(nonVegSnapshot.docs.map((doc) => doc['title'] as String));

    final QuerySnapshot specialSnapshot = await firestore
        .collection('Special_Pizza')
        .where('title', isGreaterThanOrEqualTo: searchText)
        .where('title', isLessThanOrEqualTo: searchText + '\uf8ff')
        .get();

    titles.addAll(specialSnapshot.docs.map((doc) => doc['title'] as String));

    return titles;
  }
}
