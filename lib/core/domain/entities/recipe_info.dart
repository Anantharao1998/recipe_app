import 'package:recipe_app/core/core.dart';

/// Recipe Info object
class RecipeInfo {
  /// RecipeInfo constructor
  RecipeInfo({required this.image, required this.name, required this.type, required this.ingredients});

  /// Recipe image. Can be String or URL.
  final String? image;

  /// Recipe name
  final String? name;

  /// List of ingredients used for the recipe
  final List<String> ingredients;

  /// Recipe type
  final RecipeType type;
}
