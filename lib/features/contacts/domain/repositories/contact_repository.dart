import 'package:dartz/dartz.dart';
import 'package:recipe_app/features/contacts/contacts.dart';

/// Contact Repository abstract class
abstract class ContactRepository {
  /// Add a Contact
  Future<void> addContact(final ContactItem contactItem);

  /// Get Contacts list
  Future<Either<Exception, List<ContactItem>>> getContacts();
}
