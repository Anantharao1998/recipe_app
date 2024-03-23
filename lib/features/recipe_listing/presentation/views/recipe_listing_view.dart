import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/recipe_listing/presentation/widgets/recipe_tile.dart';
import 'package:recipe_app/features/recipe_listing/recipe_listing.dart';

/// RecipeListing page
class RecipeListingView extends BaseView<RecipeListingController> {
  /// Recipe Listing View constructor
  RecipeListingView({super.key});

  @override
  String? appBarTitle() => AppStrings.recipeListingAppBarTitle;
  @override
  Widget body(final BuildContext context, final RecipeListingController controller) => ListView.builder(
        itemCount: controller.recipeList.length,
        itemBuilder: (
          final BuildContext context,
          final int index,
        ) =>
            RecipeTile(
          recipe: controller.recipeList[index],
        ),
      );
}
