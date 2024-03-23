import 'package:recipe_app/core/core.dart';

/// Recipe Tile widget
class RecipeTile extends StatelessWidget {
  /// constructor
  const RecipeTile({required this.recipe, super.key});

  /// Recipe object
  final RecipeInfo recipe;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(AppValues.double_5),
        child: ListTile(
          tileColor: AppColors.primaryColor,
          title: (recipe.name != null)
              ? Text(
                  recipe.name!,
                )
              : const SizedBox(),
          leading: (recipe.image != null)
              ? SizedBox(
                  height: AppValues.double_30,
                  width: AppValues.double_30,
                  child: ImageView(
                    file: recipe.image!,
                    fit: BoxFit.contain,
                  ),
                )
              : const Icon(
                  Icons.image_not_supported_outlined,
                ),
        ),
      );
}
