import 'package:get_it/get_it.dart';
import 'package:recipe_app/features/recipe_listing/recipe_listing.dart';

/// Recipe bindings
void registerRecipeListings(final GetIt getIt) {
  getIt.registerFactory(() => RecipeListingController());
}
