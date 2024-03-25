import 'package:recipe_app/dependency_injection.dart';
import 'package:recipe_app/features/recipe_listing/recipe_listing.dart';

/// Recipe bindings
void registerRecipeListings(final GetIt getIt) {
  /// Register repository
  getIt.registerFactory(() => RecipeListingRepository());

  /// Register controller
  getIt.registerFactory(() => RecipeListingController(repository: locator()));
}
