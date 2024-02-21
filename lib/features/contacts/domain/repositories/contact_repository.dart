import 'package:pokemondb/features/contacts/contacts.dart';

/// Contact Repository abstract class
abstract class ContactRepository {
  /// Add a Contact
  Future<void> addContact(final ContactItem contactItem);

  /// Get Contacts list
  Future<List<ContactItem>> getContacts();
}
