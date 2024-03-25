// ignore_for_file: always_specify_types

import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/core.dart';

/// Recipes Listing repository
class RecipeListingRepository extends HiveService {
  /// Recipe box name
  static const String recipeBox = AppStrings.recipeListingAppBarTitle;

  /// gets recipes from HiveBox
  Future<Either<Exception, List<RecipeInfo>>> fetchRecipes() async {
    try {
      final List<dynamic> result = await fetchData();

      final List<RecipeInfo> recipes = result
          .map(
            (final e) => RecipeInfo.fromJson(
              MapUtils.convertDynamicMap(e),
            ),
          )
          .toList();
      return Right(
        recipes,
      );
    } on Exception catch (error) {
      return Left(error);
    }
  }

  /// puts recipes inside HiveBox
  Future<void> putRecipes(final RecipeInfo item) async {
    await insertData(
      item.toJson(),
    );
  }
}
