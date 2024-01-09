import 'package:get_it/get_it.dart';
import 'package:pokemondb/dependency_injection.dart';
import 'package:pokemondb/features/homepage/homepage.dart';

/// HomeBindings
void homeBindings(final GetIt getIt) {
  getIt

    /// register datasource
    ..registerFactory<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl())

    /// register repository
    ..registerFactory<HomeRepository>(() => HomeRepositoryImpl(remoteDataSource: locator()))

    /// Register usecases
    ..registerFactory<GetPokemonList>(
      () => GetPokemonList(repository: locator()),
    );
}
