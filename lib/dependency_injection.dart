import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';
import 'package:pokemondb/features/homepage/homepage.dart';

/// GetIt instance
final GetIt locator = GetIt.instance;

/// Dependency init method
Future<void> init() async {
  /// Packages initiating
  locator
    ..registerLazySingleton(() => Dio())

    /// Register services
    ..registerLazySingleton<DioClient>(
      () => DioServiceImpl(
        dioService: locator(),
      ),
    );

  homeBindings(locator);
  contactsBinding(locator);

  return;
}
