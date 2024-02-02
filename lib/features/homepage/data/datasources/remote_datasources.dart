// ignore_for_file: always_specify_types
// TODO [Anantha]: Remove unnecessary methods

/// HomeRemoteDataSource
abstract class HomeRemoteDataSource {
  /// fetch all pokemon cards
  Future<List<dynamic>> fetchPokemonCards();

  /// Fetch account details
  void fetchAccountDetails();
}

/// Implementation of [HomeRemoteDataSource]

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  void fetchAccountDetails() => throw UnimplementedError();

  @override
  Future<List<dynamic>> fetchPokemonCards() => throw UnimplementedError();
}
