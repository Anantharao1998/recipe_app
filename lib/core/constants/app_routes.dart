// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:pokemondb/features/contacts/contacts.dart';
import 'package:pokemondb/features/events/events.dart';
import 'package:pokemondb/features/homepage/homepage.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> routes(final RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
      case Routes.home:
        return _pageRoute(HomeView(), settings);
      case Routes.eventsList:
        return _pageRoute(const EventsListPage(), settings);
      case Routes.addContacts:
        return _pageRoute(AddContactsView(), settings);
      case Routes.contactList:
        return _pageRoute(ContactsListing(), settings);
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

  static const String addContacts = '/addContacts';
  static const String contactList = '/contactList';
  static const String eventsList = '/eventsList';
  static const String home = '/home';
  static const String initialRoute = '/';
}
