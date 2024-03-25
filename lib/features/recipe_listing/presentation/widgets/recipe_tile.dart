import 'package:recipe_app/core/core.dart';

/// Recipe Tile widget
class RecipeTile extends StatelessWidget {
  /// constructor
  const RecipeTile({required this.recipe, required this.onDelete, required this.onUpdate, this.canChange = true, super.key});

  /// Recipe cant be delete or updated when filtering
  final bool canChange;

  /// Delete recipe callback
  final VoidCallback onDelete;

  /// Update recipe callback
  final VoidCallback onUpdate;

  /// Recipe object
  final RecipeInfo recipe;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(AppValues.double_5),
        child: ListTile(
          onTap: () async => navigationService.navigateTo(Routes.recipeDetail, args: recipe),
          tileColor: AppColors.primaryColor,
          title: (recipe.name != null)
              ? Text(
                  recipe.name!,
                )
              : const SizedBox(),
          leading: (recipe.image != null)
              ? Padding(
                  padding: const EdgeInsets.all(AppValues.double_10),
                  child: ImageView(
                    width: AppValues.double_30,
                    file: recipe.image!,
                    fit: BoxFit.contain,
                  ),
                )
              : const Icon(
                  Icons.image_not_supported_outlined,
                ),
          trailing: canChange
              ? Padding(
                  padding: const EdgeInsets.all(AppValues.double_5),
                  child: Column(
                    children: <Widget>[
                      const Icon(
                        Icons.edit,
                        size: AppValues.double_20,
                      ).onTap(onTap: () => onUpdate.call()),
                      const Spacer(),
                      const Icon(
                        Icons.delete,
                        size: AppValues.double_20,
                      ).onTap(onTap: () => onDelete.call()),
                    ],
                  ),
                )
              : const SizedBox(),
        ),
      );
}
