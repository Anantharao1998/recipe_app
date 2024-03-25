// ignore_for_file: public_member_api_docs

enum RecipeType {
  appetizers,
  soups,
  salads,
  mainCourses,
  sideDishes,
  desserts,
  beverages,
  snacks,
  noodleDishes,
  riceDishes,
  grilledDishes,
  stirFries,
  curries,
  sambals,
  condiments,
  breads,
  pastries,
  cakes,
  cookies,
  traditionalSweets,
  drinks,
  vegetarian,
  seafood,
  meat,
  poultry,
  tofuTempeh,
  streetFood,
  fusion,
  festiveSpecials,
}

extension RecipeTypeExtension on RecipeType {
  // Convert enum to string
  String toStringValue() => toString().split('.').last;

  static List<String> get list => RecipeType.values.map((final RecipeType e) => e.toStringValue()).toList();
}

extension StringRecipeTypeExtension on String {
  // Convert string to enum
  RecipeType toRecipeTypeEnum() => RecipeType.values.firstWhere(
        (final RecipeType type) => type.toStringValue() == this,
        orElse: () => RecipeType.mainCourses,
      );
}
