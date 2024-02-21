import 'package:pokemondb/dependency_injection.dart';
import 'package:pokemondb/features/homepage/homepage.dart';

/// HomeBindings
void homeBindings(final GetIt getIt) {
  getIt

    /// Register controller
    ..registerFactory<HomeController>(() => HomeController())

    /// register datasource
    ..registerFactory<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl())

    /// register repository
    ..registerFactory<HomeRepository>(() => HomeRepositoryImpl(remoteDataSource: locator()));
}
