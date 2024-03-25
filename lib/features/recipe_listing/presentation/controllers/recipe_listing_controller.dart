// ignore_for_file: type_annotate_public_apis, always_specify_types

import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/recipe_listing/data/repositories/recipe_listing_repo.dart';

/// Controller of RecipeListingView
class RecipeListingController extends BaseController {
  /// Constructor
  RecipeListingController({required this.repository});

  /// Current selected recipe
  RecipeType? currentRecipe;

  /// Recipe image
  String imagePath = '';

  /// Recipe ingredient
  final TextEditingController ingredient = TextEditingController();

  /// Current ingredients added in the Add Recipe.
  List<String> ingredientsList = <String>[];

  /// Master Recipe List
  final List<RecipeInfo> masterRecipeList = <RecipeInfo>[];

  /// Recipe name
  final TextEditingController name = TextEditingController();

  /// RecipeList for display
  final List<RecipeInfo> recipeList = <RecipeInfo>[];

  /// recipe listing viewstate
  ViewState recipeState = ViewState.initial;

  /// Recipe Listing repository
  final RecipeListingRepository repository;

  /// Recipe Type choosen by user
  String? selectedAddRecipe;

  /// Selected recipe
  String? selectedRecipe;

  /// Recipe steps
  final TextEditingController steps = TextEditingController();

  /// Get recipes
  Future<void> getRecipes({final bool rebuild = false}) async {
    recipeState = ViewState.loading;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // This is to mimic API call in real scenario

    /// Calls API (in this case, Hive) and gets it's response.
    await repository.fetchRecipes().onResponse(
      (final List<RecipeInfo> result) {
        if (selectedRecipe == null) {
          if (masterRecipeList.isEmpty) {
            masterRecipeList.addAll(result);
          } else if (rebuild) {
            masterRecipeList.clear();

            masterRecipeList.addAll(result);
          }

          recipeList.clear();

          recipeList.addAll(masterRecipeList);
        } else {
          recipeList.clear();

          recipeList.addAll(
            masterRecipeList.where(
              (final RecipeInfo recipe) => recipe.type == selectedRecipe!.toRecipeTypeEnum(),
            ),
          );
        }

        recipeState = ViewState.success;

        notifyListeners();
      },
      (final Exception error) {
        recipeState = ViewState.error;

        notifyListeners();
      },
    );
  }

  /// Add ingredient
  void addIngredient() {
    if (ingredient.text.isNotEmpty) {
      ingredientsList.add(ingredient.text);

      // clear textfield
      ingredient.clear();

      notifyListeners();
    } else {
      return;
    }
  }

  /// remove ingredient from the add recipe page
  void removeIngredient(final int index) {
    ingredientsList.removeAt(index);
    notifyListeners();
  }

  /// Add Recipe
  Future<void> addRecipe() async {
    final RecipeInfo newRecipe = RecipeInfo(
      ingredients: ingredientsList,
      name: name.text,
      steps: steps.text,
      image: imagePath,
      type: selectedAddRecipe!.toRecipeTypeEnum(),
    );

    await repository.putRecipes(newRecipe);

    navigationService.pop();
  }

  /// save selected image into asset
  Future<void> saveImage(final XFile picture) async {
    await ImageUtils.saveImageAsAsset(picture).then(
      (final String value) => <String>{
        imagePath = value,
      },
    );
  }

  /// on recipe select
  Future<void> onRecipeSelect(final value, final String? name) async {
    selectedRecipe = name;

    await getRecipes();

    notifyListeners();
  }

  /// Called when user selected recipe type in Add Recipe page
  void onUserRecipeSelect(final value, final String? name) {
    selectedAddRecipe = name;

    notifyListeners();
  }

  /// Delete recipe
  Future<void> deleteRecipe(final int index) async {
    await repository.deleteRecipe(index);

    await getRecipes(rebuild: true);
  }
}
