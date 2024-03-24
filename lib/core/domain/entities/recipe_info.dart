import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_app/core/core.dart';

part 'recipe_info.g.dart';

/// Recipe Info object
@JsonSerializable()
class RecipeInfo {
  /// RecipeInfo constructor
  RecipeInfo({this.type, this.ingredients, this.image, this.name, this.steps});

  /// Gets RecipeInfo instance from Map.
  factory RecipeInfo.fromJson(final Map<String, dynamic> json) => _$RecipeInfoFromJson(json);

  /// Recipe image. Can be String or URL.
  final String? image;

  /// Recipe name
  final String? name;

  /// List of ingredients used for the recipe
  final List<String>? ingredients;

  /// Recipe type
  final RecipeType? type;

  /// Steps to make this recipe
  final String? steps;

  /// Returns Map of the object
  Map<String, dynamic> toJson() => _$RecipeInfoToJson(this);
}
