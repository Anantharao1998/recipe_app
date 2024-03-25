// ignore_for_file: public_member_api_docs

class AppStrings {
  AppStrings._();

  static const String addRecipe = 'Add Recipe';
  static const String cookingSteps = 'Steps to make';
  static const String currentIngredients = 'Current Ingredients';
  static const String generalErrorMessage = 'An error has occured';
  static const String generalFieldEmptyError = 'This is a mandatory field. Must not be empty.';
  static const String ingredients = 'Ingredients';
  static const String name = 'Name';
  static const String noInternetConnection = 'Please have an active internet connection.';
  static const String recipeIngredient = 'Ingredient name';
  static const String recipeListingAppBarTitle = 'Recipes';
  static const String recipeName = 'Recipe name';
  static const String recipeType = 'Recipe type';
  static const String recipesList = 'RecipesList';
  static const String remove = 'Remove';
  static const String selectRecipeType = 'Select recipe type';
  static const String noRecipes = 'There is no recipes to show';
  static const String submit = 'Submit';
  static const String pickImage = 'Add Recipe Picture';

  static String commonEmptyList({required final String item}) => 'There are no ${item.toLowerCase()}s.';
}
