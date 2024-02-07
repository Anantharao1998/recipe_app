import 'package:get_it/get_it.dart';
import 'package:pokemondb/features/contacts/contacts.dart';

/// Contacts binding
void contactsBinding(final GetIt getIt) {
  getIt.registerFactory(() => ContactsController());
}
