import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/core/extensions/exception_extension.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Contacts View controller
class ContactsController extends BaseController {
  /// Constructor class
  ContactsController({required this.repository});

  /// master list of contacts list
  List<ContactItem> contactsList = <ContactItem>[];

  /// Firebase instance
  final FirebaseFirestore db = FirebaseFirestore.instance;

  /// Repository for contacts module
  final ContactRepository repository;

  ///  total contacts to be displayed in the contacts list page
  final int totalContacts = AppValues.int_100;

  /// get data
  Future<void> getData() async {
    setLoading();
    await repository.getContacts().onResponse(
      (final List<ContactItem> result) {
        contactsList = result;
      },
      (final Exception error) {},
    );

    setSuccess();
  }
}
