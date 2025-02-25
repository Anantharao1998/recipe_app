// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:recipe_app/features/recipe_detail/recipe_detail.dart';
import 'package:recipe_app/features/recipe_listing/recipe_listing.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> routes(final RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return _pageRoute(RecipeListingView(), settings);
      case Routes.recipeDetail:
        return _pageRoute(RecipeDetailView(), settings);
      case Routes.addRecipe:
        return _pageRoute(AddRecipeView(), settings);
      default:
        return MaterialPageRoute<Widget>(
          builder: (final _) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static MaterialPageRoute<Widget> _pageRoute(final Widget page, final RouteSettings settings) => MaterialPageRoute<Widget>(
        builder: (final _) => page,
        settings: settings,
      );
}

class Routes {
  Routes._();

  static const String initialRoute = '/';
  static const String recipeDetail = '/recipeDetail';
  static const String addRecipe = '/addRecipe';
}
