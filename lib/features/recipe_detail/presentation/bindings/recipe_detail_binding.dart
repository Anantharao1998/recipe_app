import 'package:get_it/get_it.dart';
import 'package:recipe_app/features/recipe_detail/recipe_detail.dart';

/// Recipe Detail binding
void registerRecipeDetail(final GetIt getIt) {
  getIt.registerFactory(() => RecipeDetailController());
}
