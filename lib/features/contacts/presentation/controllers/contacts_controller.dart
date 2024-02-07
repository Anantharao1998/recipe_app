import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemondb/core/core.dart';

/// Contacts View controller
class ContactsController extends BaseController {

  
  /// Firebase instance
  final FirebaseFirestore db = FirebaseFirestore.instance;

  ///  total contacts to be displayed in the contacts list page
  final int totalContacts = AppValues.int_100;

  /// Add contact
  Future<void> addContact() async {
    // Create a new user with a first and last name
    final Map<String, dynamic> user = <String, dynamic>{
      'name': 'Arvind',
      'description': 'Working as doctor',
      'age': 24,
    };

    await db.collection('contacts').add(user);
  }

  /// get data
  Future<void> getData() async {
    await db.collection('contacts').get().then((final QuerySnapshot<Map<String, dynamic>> event) {
      for (final QueryDocumentSnapshot<Map<String, dynamic>> doc in event.docs) {
        if (kDebugMode) {
          print('${doc.id} => ${doc.data()}');
        }
      }
    });
  }
}
