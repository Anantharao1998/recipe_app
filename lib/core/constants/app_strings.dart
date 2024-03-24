// ignore_for_file: public_member_api_docs

class AppStrings {
  AppStrings._();

  static const String recipeListingAppBarTitle = 'Recipes';
  static const String recipesList = 'RecipesList';
  static const String generalFieldEmptyError = 'This is a mandatory field. Must not be empty.';
  static const String name = 'Name';
  static const String noInternetConnection = 'Please have an active internet connection.';
  static const String recipeType = 'Recipe type';
  static const String ingredients = 'Ingredients';

  static String commonEmptyList({required final String item}) => 'There are no ${item.toLowerCase()}s.';
}
