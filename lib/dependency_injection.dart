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
  await HiveServices().initHive();

  registerRecipeListings(locator);
  registerRecipeDetail(locator);
  return;
}
