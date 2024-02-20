import 'package:cloud_firestore/cloud_firestore.dart';

/// Firebase instance
final FirebaseFirestore db = FirebaseFirestore.instance;

/// BaseFireStore implementation
mixin BaseFireStoreServices {
  /// get data
  Future<QuerySnapshot<Map<String, dynamic>>> get(final String collection) async => db.collection(collection).get();

  /// post item
  Future<void> post(final String collection, final Map<String, dynamic> object) async => db.collection(collection).add(object);
}
