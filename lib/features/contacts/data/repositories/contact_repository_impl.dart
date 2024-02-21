import 'package:pokemondb/features/contacts/contacts.dart';
import 'package:pokemondb/features/contacts/data/datasources/contact_remote_datasource.dart';

/// Contact repository implementation
class ContactRepositoryImpl implements ContactRepository {
  /// Constructor
  ContactRepositoryImpl({required this.remoteDataSource});

  /// Remote datasource instance
  final ContactRemoteDataSource remoteDataSource;

  @override
  Future<void> addContact(final ContactItem contactItem) async {
    await remoteDataSource.addContact(contactItem.toJson());
  }

  @override
  Future<List<ContactItem>> getContacts() async {
    final List<ContactItem> result = await remoteDataSource.getContact();

    return result;
  }
}
