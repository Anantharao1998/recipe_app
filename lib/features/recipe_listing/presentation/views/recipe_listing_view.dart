// ignore_for_file: always_specify_types

import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/recipe_listing/recipe_listing.dart';

/// RecipeListing page
class RecipeListingView extends BaseView<RecipeListingController> {
  /// Recipe Listing View constructor
  RecipeListingView({super.key});

  @override
  String? appBarTitle() => AppStrings.recipeListingAppBarTitle;

  @override
  Widget body(final BuildContext context, final RecipeListingController controller) => Padding(
        padding: const EdgeInsets.all(AppValues.double_15),
        child: Column(
          children: <Widget>[
            Selector<RecipeListingController, String?>(
              builder: (final context, final value, final _) => CustomDropDown(
                hideTitle: true,
                context: context,
                selectedText: controller.selectedRecipe,
                hintText: AppStrings.selectRecipeType,
                onValueSelected: (final value, final name) async => controller.onRecipeSelect(value, name),
                modelBottomList: RecipeTypeExtension.list
                    .map(
                      (final e) => BottomSheetEntity(name: e, metaData: e),
                    )
                    .toList(),
              ),
              selector: (final p0, final p1) => p1.selectedRecipe,
            ),
            Expanded(
              child: Selector<RecipeListingController, ViewState>(
                builder: (final BuildContext context, final state, final __) => state == ViewState.loading
                    ? const Center(child: CircularProgressIndicator())
                    : controller.recipeList.isEmpty
                        ? const SizedBox(
                            height: AppValues.double_40,
                            child: Center(
                              child: Text(AppStrings.noRecipes),
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.recipeList.length,
                            itemBuilder: (
                              final BuildContext context,
                              final int index,
                            ) =>
                                RecipeTile(
                              recipe: controller.recipeList[index],
                              onDelete: () async {
                                await controller.deleteRecipe(index);
                              },
                              onUpdate: () {
                                // TODO: Update recipe
                              },
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
        ),
      );

  @override
  Widget? floatingActionButton(final BuildContext context, final RecipeListingController controller) => FloatingActionButton.extended(
        onPressed: () async {
          controller.selectedRecipe = null;

          await navigationService.navigateTo(Routes.addRecipe).then((final value) async {
            controller.masterRecipeList.clear();
            await controller.getRecipes();
          });
        },
        label: const Text(
          AppStrings.addRecipe,
          style: AppStyles.h5,
        ),
      );

  @override
  Future<void> onInit(final RecipeListingController provider, final BuildContext context) async {
    await provider.getRecipes();
  }
}
