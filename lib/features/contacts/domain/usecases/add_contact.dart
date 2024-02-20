import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Add Contacts usecase
class AddContacts extends BaseUseCase<ContactItem> {
  /// Add Contacts usecase
  AddContacts({required this.repository});

  /// Repository instance
  final ContactRepository repository;

  @override
  void call(final ContactItem data) {
    repository.addContact(data);
  }
}
