import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/recipe_listing/data/repositories/recipe_listing_repo.dart';

/// Controller of RecipeListingView
class RecipeListingController extends BaseController {
  /// Constructor
  RecipeListingController({required this.repository});

  /// Recipe Listing repository
  final RecipeListingRepository repository;

  /// Current selected recipe
  RecipeType? currentRecipe;

  /// Recipe List
  final List<RecipeInfo> recipeList = <RecipeInfo>[];

  /// recipe listing viewstate
  ViewState recipeState = ViewState.initial;

  /// Get recipes
  Future<void> getRecipes() async {

    /// Calls API (in this case, Hive) and gets it's response.
    await repository.fetchRecipes().onResponse(
      (final List<RecipeInfo> result) {
        recipeList.addAll(result);

        recipeState = ViewState.success;

        notifyListeners();
      },
      (final Exception error) {
        recipeState = ViewState.error;

        notifyListeners();
      },
    );
  }
}
