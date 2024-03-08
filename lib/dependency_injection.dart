import 'package:get_it/get_it.dart';
import 'package:pokemondb/features/contacts/contacts.dart';
import 'package:pokemondb/features/homepage/homepage.dart';
import 'package:pokemondb/features/splash/splash.dart';
export 'package:get_it/get_it.dart';

/// GetIt instance
final GetIt locator = GetIt.instance;

/// Dependency init method
Future<void> init() async {
  registerSplash(locator);
  homeBindings(locator);
  contactsBinding(locator);

  return;
}
