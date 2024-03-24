import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/recipe_listing/presentation/widgets/recipe_tile.dart';
import 'package:recipe_app/features/recipe_listing/recipe_listing.dart';

/// RecipeListing page
class RecipeListingView extends BaseView<RecipeListingController> {
  /// Recipe Listing View constructor
  RecipeListingView({super.key});

  @override
  Future<void> onInit(final RecipeListingController provider, final BuildContext context) async {
    await provider.getRecipes();
  }

  @override
  String? appBarTitle() => AppStrings.recipeListingAppBarTitle;
  @override
  Widget body(final BuildContext context, final RecipeListingController controller) => Column(
        children: <Widget>[
          const Placeholder(
            fallbackHeight: AppValues.double_50,
          ),
          Expanded(
            child: Selector<RecipeListingController, ViewState>(
              builder: (final BuildContext context, final _, final __) => ListView.builder(
                itemCount: controller.recipeList.length,
                itemBuilder: (
                  final BuildContext context,
                  final int index,
                ) =>
                    RecipeTile(
                  recipe: controller.recipeList[index],
                ),
              ),
              selector: (
                final BuildContext context,
                final RecipeListingController controller,
              ) =>
                  controller.recipeState,
            ),
          ),
        ],
      );
}
