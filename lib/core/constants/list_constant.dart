import 'package:recipe_app/core/core.dart';

/// Static recipe list
List<RecipeInfo> recipesList = <RecipeInfo>[
  const RecipeInfo(
    image: 'https://www.andy-cooks.com/cdn/shop/articles/20231116072724-c2-a9andy_cooks_thumbnails_nasi_lemak_01.jpg?v=1700389619',
    name: 'Nasi Lemak',
    ingredients: <String>['1. Coconut milk', '2. Rice'],
    type: RecipeType.mainCourses,
  ),
  const RecipeInfo(
    image: 'https://cdn.motherhood.com.my/wp-content/uploads/sites/2/2022/05/16192140/resepi-nasi-ayam-lengkap-1024x674.png',
    name: 'Nasi Ayam',
    ingredients: <String>[],
    type: RecipeType.seafood,
  ),
  const RecipeInfo(
    image: 'https://christieathome.com/wp-content/uploads/2020/12/Mee-Goreng-8-2048x2048.jpg',
    name: 'Mee Goreng',
    ingredients: <String>[],
    type: RecipeType.beverages,
  ),
  const RecipeInfo(
    image:
        'https://www.foodandwine.com/thmb/4qg95tjf0mgdHqez5OLLYc0PNT4=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/classic-cheese-pizza-FT-RECIPE0422-31a2c938fc2546c9a07b7011658cfd05.jpg',
    name: 'Pizza',
    ingredients: <String>[],
    type: RecipeType.salads,
  ),
];
