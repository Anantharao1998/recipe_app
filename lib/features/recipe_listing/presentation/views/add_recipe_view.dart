// ignore_for_file: always_specify_types

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/recipe_listing/recipe_listing.dart';

/// Add Recipe page
class AddRecipeView extends BaseView<RecipeListingController> {
  /// Constructor
  AddRecipeView({super.key});

  @override
  String? appBarTitle() => AppStrings.addRecipe;

  @override
  Widget body(final BuildContext context, final RecipeListingController controller) => Padding(
        padding: const EdgeInsets.all(AppValues.double_20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              /// Name
              CustomTextField(
                labelText: AppStrings.recipeName,
                textEditingController: controller.name,
                hintText: AppStrings.recipeName,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: CustomTextField(
                      labelText: AppStrings.recipeIngredient,
                      textEditingController: controller.ingredient,
                      hintText: AppStrings.recipeIngredient,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async => controller.addIngredient(),
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ],
              ),

              Selector<RecipeListingController, int>(
                builder: (final BuildContext context, final int length, final Widget? child) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      AppStrings.currentIngredients,
                      style: AppStyles.h5,
                    ),

                    /// Add Ingredient
                    if (length > 0)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: length,
                        itemBuilder: (final BuildContext context, final int index) => Row(
                          children: <Widget>[
                            Text(
                              '${index + 1}. ${controller.ingredientsList[index]}',
                              style: AppStyles.norm_5,
                            ),
                            const Spacer(),
                            Text(
                              AppStrings.remove,
                              style: AppStyles.h6.copyWith(color: AppColors.bluePrimary),
                            ).onTap(onTap: () => controller.removeIngredient(index)),
                          ],
                        ),
                      ),
                    if (length == 0)
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'No ingredient added',
                          style: AppStyles.norm_5,
                        ),
                      ),
                  ],
                ),
                selector: (final BuildContext p0, final RecipeListingController p1) => p1.ingredientsList.length,
              ),
              const SizedBox(
                height: AppValues.double_10,
              ),
              Selector<RecipeListingController, String?>(
                builder: (final BuildContext context, final String? value, final _) => CustomDropDown(
                  labelText: AppStrings.selectRecipeType,
                  context: context,
                  selectedText: controller.selectedAddRecipe,
                  hintText: AppStrings.selectRecipeType,
                  onValueSelected: (final value, final String? name) => controller.onUserRecipeSelect(value, name),
                  modelBottomList: RecipeTypeExtension.list
                      .map(
                        (final String e) => BottomSheetEntity(name: e, metaData: e),
                      )
                      .toList(),
                ),
                selector: (final BuildContext p0, final RecipeListingController p1) => p1.selectedAddRecipe,
              ),

              /// Steps
              CustomTextField(
                maxLines: 10,
                maxLength: 2000,
                labelText: AppStrings.cookingSteps,
                textEditingController: controller.steps,
              ),

              ImagePickerWidget(
                onImagePick: (final XFile picture) async => controller.saveImage(picture),
              ),

              const SizedBox(
                height: AppValues.double_20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (controller.name.text.isEmpty ||
                      controller.ingredientsList.isEmpty ||
                      controller.selectedAddRecipe == null ||
                      controller.steps.text.isEmpty ||
                      controller.imagePath.isEmpty) {
                    showErrorSnackBar('Incomplete recipe detail');
                  } else {
                    await controller.addRecipe();
                  }
                },
                child: const Text(AppStrings.submit),
              ),
            ],
          ),
        ),
      );
}
