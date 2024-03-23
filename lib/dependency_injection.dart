import 'package:get_it/get_it.dart';
import 'features/recipe_listing/recipe_listing.dart';
export 'package:get_it/get_it.dart';

/// GetIt instance
final GetIt locator = GetIt.instance;

/// Dependency init method
Future<void> init() async {
  registerRecipeListings(locator);
  return;
}
