import 'package:get_it/get_it.dart';
import 'package:recipe_app/features/contacts/contacts.dart';
import 'package:recipe_app/features/homepage/homepage.dart';
import 'package:recipe_app/features/splash/splash.dart';
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
