import 'package:pokemondb/features/contacts/contacts.dart';

/// Contact Repository abstract class
abstract class ContactRepository {
  /// Add a Contact
  void addContact(final ContactItem contactItem);

  /// Get Contacts list
  void getContacts(final List<ContactItem> contacts);
}
