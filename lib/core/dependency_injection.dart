import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemondb/core/core.dart';

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
}
