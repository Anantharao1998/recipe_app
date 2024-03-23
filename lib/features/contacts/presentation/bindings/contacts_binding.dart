import 'package:recipe_app/dependency_injection.dart';
import 'package:recipe_app/features/contacts/contacts.dart';
import 'package:recipe_app/features/contacts/data/datasources/contact_remote_datasource.dart';

/// Contacts binding
void contactsBinding(final GetIt getIt) {
  getIt.registerFactory<ContactRemoteDataSource>(() => ContactRemoteDataSourceImpl());

  getIt.registerFactory<ContactRepository>(() => ContactRepositoryImpl(remoteDataSource: locator()));

  getIt.registerFactory(() => ContactsController(repository: locator()));
}
