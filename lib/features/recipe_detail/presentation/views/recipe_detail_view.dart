// ignore_for_file: must_be_immutable

import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/recipe_detail/recipe_detail.dart';

/// Recipe Detail page
class RecipeDetailView extends BaseView<RecipeDetailController> {
  /// Recipe Detail constructor
  RecipeDetailView({super.key});

  late RecipeInfo? _recipe;

  @override
  void onInit(final RecipeDetailController provider, final BuildContext context) {
    _recipe = ModalRoute.of(context)?.settings.arguments as RecipeInfo?;

    super.onInit(provider, context);
  }

  @override
  String? appBarTitle() => _recipe?.name ?? '';

  @override
  Widget body(final BuildContext context, final RecipeDetailController controller) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        ImageView(
          file: _recipe?.image ?? '',
          fit: BoxFit.fitWidth,
          width: double.infinity,
          height: screenHeight / 4,
        ),
        _itemDetail(AppStrings.recipeType, subtitle: _recipe?.type.toString()),
        _itemDetail(AppStrings.ingredients, contents: _recipe?.ingredients),
      ],
    );
  }

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
              ListView.builder(shrinkWrap: true,
                itemCount: contents.length,
                itemBuilder: (final BuildContext context, final int index) => Text(
                  contents[index],
                ),
              ),
          ],
        ),
      );
}
