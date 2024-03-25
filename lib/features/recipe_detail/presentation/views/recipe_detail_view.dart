// ignore_for_file: must_be_immutable

import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/recipe_detail/recipe_detail.dart';

/// Recipe Detail page
class RecipeDetailView extends BaseView<RecipeDetailController> {
  /// Recipe Detail constructor
  RecipeDetailView({super.key});

  late RecipeInfo? _recipe;

  @override
  String? appBarTitle() => _recipe?.name ?? '';

  @override
  Widget body(final BuildContext context, final RecipeDetailController controller) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ImageView(
            file: _recipe?.image ?? '',
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: screenHeight / 4,
          ),
          if (_recipe?.type?.toStringValue() != null)
            _itemDetail(
              AppStrings.recipeType,
              subtitle: _recipe?.type?.toStringValue().toUpperCase(),
            ),
          if (_recipe?.ingredients != null)
            _itemDetail(
              AppStrings.ingredients,
              contents: _recipe!.ingredients,
            ),
          if (_recipe?.steps != null)
            _recipeSteps(
              AppStrings.cookingSteps,
              _recipe!.steps!,
            ),
          const SizedBox(
            height: AppValues.double_20,
          ),
        ],
      ),
    );
  }

  @override
  void onInit(final RecipeDetailController provider, final BuildContext context) {
    _recipe = ModalRoute.of(context)?.settings.arguments as RecipeInfo?;

    super.onInit(provider, context);
  }

  Widget _recipeSteps(
    final String title,
    final String subtitle,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.double_20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '$title : ',
              style: AppStyles.h5,
            ),
            Text(subtitle),
          ],
        ),
      );

  Widget _itemDetail(
    final String title, {
    final List<String>? contents,
    final String? subtitle,
  }) =>
      Padding(
        padding: const EdgeInsets.all(AppValues.double_20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '$title : ',
                  style: AppStyles.h5,
                ),
                if (subtitle != null) Text(subtitle),
              ],
            ),
            if (contents != null && contents.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: contents.length,
                itemBuilder: (final BuildContext context, final int index) => Text(
                  '${index + 1}. ${contents[index]}',
                ),
              ),
          ],
        ),
      );
}
