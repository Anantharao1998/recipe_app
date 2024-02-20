import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// ContactRepository implementation
class ContactRepositoryImpl extends ContactRepository with BaseFireStoreServices {
  @override
  Future<void> addContact(final ContactItem contactItem) async {
    try {
      await post(AppStrings.contactCollection, contactItem.toJson());
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  void getContacts(final List<ContactItem> contacts) {
    // TODO: implement getContacts
  }
}
