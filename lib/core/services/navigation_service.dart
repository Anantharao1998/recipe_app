// ignore_for_file: always_specify_types, type_annotate_public_apis

import 'package:flutter/material.dart';

/// App Navigation Service
class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  /// Global navigation key
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  /// Push a new widget to the tree
  Future<dynamic> navigateTo(
    final String routeName, {
    final Object? args,
  }) =>
      _navigationKey.currentState!.pushNamed(routeName, arguments: args);

  /// Pop the current screen
  void pop<T>({final T? object}) => _navigationKey.currentState!.pop<T>(object);
}

/// Global instane of navigation service
final NavigationService navigationService = NavigationService();
