import 'package:pokemondb/dependency_injection.dart';
import 'package:pokemondb/features/contacts/contacts.dart';
import 'package:pokemondb/features/contacts/data/datasources/contact_remote_datasource.dart';

/// Contacts binding
void contactsBinding(final GetIt getIt) {
  getIt.registerFactory<ContactRemoteDataSource>(() => ContactRemoteDataSourceImpl());

  getIt.registerFactory<ContactRepository>(() => ContactRepositoryImpl(remoteDataSource: locator()));

  getIt.registerFactory(() => ContactsController(repository: locator()));
}
