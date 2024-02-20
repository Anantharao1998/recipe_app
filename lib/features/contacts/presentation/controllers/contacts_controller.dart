import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Contacts View controller
class ContactsController extends BaseController {
  /// master list of contacts list
  final List<ContactItem> contactsList = <ContactItem>[];

  /// Firebase instance
  final FirebaseFirestore db = FirebaseFirestore.instance;

  ///  total contacts to be displayed in the contacts list page
  final int totalContacts = AppValues.int_100;

  /// get data
  Future<void> getData() async {
    await db.collection(AppStrings.contactCollection).get().then((final QuerySnapshot<Map<String, dynamic>> event) {
      for (final QueryDocumentSnapshot<Map<String, dynamic>> doc in event.docs) {
        if (kDebugMode) {
          print('${doc.id} => ${doc.data()}');
        }

        contactsList.add(ContactItemsModel.fromJson(doc.data()));
      }
    });

    notifyListeners();
  }
}
