import 'package:recipe_app/core/core.dart';

/// Static recipe list
List<RecipeInfo> recipesList = <RecipeInfo>[
  const RecipeInfo(
    image: 'https://www.andy-cooks.com/cdn/shop/articles/20231116072724-c2-a9andy_cooks_thumbnails_nasi_lemak_01.jpg?v=1700389619',
    name: 'Nasi Lemak',
    ingredients: <String>[
      '2 cups rice',
      '1 cup coconut milk',
      '2 cups water',
      '2 pandan leaves',
      '1 teaspoon salt',
      '2 eggs',
      '1 cucumber',
      '1/2 cup peanuts',
      '1/2 cup anchovies',
      '5-10 chili peppers',
      '3 shallots',
      '2 cloves garlic',
      '1 tablespoon shrimp paste',
      '2 tablespoons sugar',
      '1 tablespoon tamarind paste',
      'Cooking oil',
      'Boil rice with coconut milk, water, pandan leaves, and salt.',
      'Boil eggs.',
      'Slice cucumber.',
      'Fry peanuts and anchovies until crispy.',
      'Blend chili peppers, shallots, garlic, shrimp paste, and sugar.',
      'Sauté blended mixture with oil until fragrant.',
      'Add tamarind paste, salt, and water to make sambal.',
      'Serve Nasi Lemak with rice, eggs, cucumber, peanuts, anchovies, and sambal.',
    ],
    type: RecipeType.mainCourses,
    steps: '''
Here's a concise recipe for making Nasi Lemak:

1. Wash and soak 2 cups of rice for 30 minutes.
2. Boil rice with 1 cup coconut milk, 2 cups water, 2 pandan leaves, and 1 tsp salt.
3. Hard-boil 2 eggs and slice 1 cucumber.
4. Fry 1/2 cup each of peanuts and anchovies until crispy.
5. Blend 5-10 chili peppers, 3 shallots, 2 cloves garlic, 1 tbsp shrimp paste, and 2 tbsp sugar for sambal.
6. Sauté blended mixture with oil until fragrant. Add 1 tbsp tamarind paste, salt, and water to make sambal.
7. Serve Nasi Lemak with rice, eggs, cucumber, peanuts, anchovies, and sambal. Enjoy!
''',
  ),
  const RecipeInfo(
    image: 'https://cdn.motherhood.com.my/wp-content/uploads/sites/2/2022/05/16192140/resepi-nasi-ayam-lengkap-1024x674.png',
    name: 'Nasi Ayam',
    ingredients: <String>[
      // For Chicken
      'Chicken (whole or parts)',
      'Ginger',
      'Garlic',
      'Shallots',
      'Lemongrass',
      'Salt',
      'Soy sauce',
      'Sesame oil',

      // For Rice
      'Long-grain rice',
      'Chicken broth (or water)',
      'Pandan leaves',
      'Garlic',
      'Ginger',
      'Salt',
      'Coconut milk',

      // For Accompaniments
      'Cucumber slices',
      'Tomato slices',
      'Lettuce leaves',
      'Red chili sauce or sambal',
      'Fried shallots',

      // Optional
      'Hard-boiled eggs',
      'Fried chicken skin',
      'Chicken liver and gizzard',
    ],
    type: RecipeType.seafood,
    steps: '''
1. Prepare the Chicken:
   - Clean and prepare the chicken (whole or parts) by removing excess fat and skin.
   - In a blender or mortar and pestle, blend or grind together ginger, garlic, shallots, and lemongrass to make a paste.
   - Rub the chicken with the prepared paste, salt, soy sauce, and sesame oil. Marinate for at least 30 minutes.
   - Heat a pan or grill over medium heat and cook the chicken until golden brown and fully cooked. Set aside.

2. Cook the Rice:
   - Rinse the long-grain rice until the water runs clear. Drain well.
   - In a pot, combine the drained rice with chicken broth (or water), pandan leaves, garlic, ginger, salt, and coconut milk.
   - Bring the mixture to a boil, then reduce the heat to low and let it simmer, covered, until the rice is cooked and fluffy.
   - Once cooked, fluff the rice with a fork and remove the pandan leaves. Keep warm.

3. Prepare the Accompaniments:
   - Slice the cucumber and tomato. Wash and dry the lettuce leaves.
   - Prepare any optional accompaniments such as hard-boiled eggs, fried chicken skin, or chicken liver and gizzard.
   - Arrange all the accompaniments on a serving plate.

4. Serve:
   - To serve, place a portion of the cooked rice on a plate.
   - Add a portion of the cooked chicken on top of the rice.
   - Serve with sliced cucumber, tomato, lettuce, and a side of red chili sauce or sambal.
   - Optionally, garnish with fried shallots and serve with any additional accompaniments.
   - Enjoy your delicious Nasi Ayam!
''',
  ),
];
