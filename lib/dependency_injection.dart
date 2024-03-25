import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/core.dart';
import 'features/recipe_detail/recipe_detail.dart';
import 'features/recipe_listing/recipe_listing.dart';
export 'package:get_it/get_it.dart';

/// GetIt instance
final GetIt locator = GetIt.instance;

/// Dependency init method
Future<void> init() async {
  /// Initialize Hive services
  await HiveService().initHive();

  registerRecipeListings(locator);
  registerRecipeDetail(locator);

  // Pre-populate recipes for the first time
  final List<RecipeInfo> recipes = <RecipeInfo>[];
  await RecipeListingRepository().fetchRecipes().onResponse(
    (final List<RecipeInfo> result) {
      recipes.addAll(result);
    },
    (final Exception error) {},
  );
  if (recipes.isEmpty) {
    // ignore: avoid_function_literals_in_foreach_calls
    recipesList.forEach((final RecipeInfo item) async {
      await RecipeListingRepository().putRecipes(item);
    });

    return;
  }
}
