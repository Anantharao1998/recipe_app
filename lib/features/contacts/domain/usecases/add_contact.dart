import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Add Contacts usecase
class AddContacts extends BaseUseCase {
  /// Add Contacts usecase
  AddContacts({required this.repository});

  /// Repository instance
  final ContactRepository repository;

  /// Call API
  @override
  void call() {
    throw UnimplementedError();
  }
  

}
