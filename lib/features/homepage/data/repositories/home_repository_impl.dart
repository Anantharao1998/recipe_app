import 'package:pokemondb/core/domain/entities/card.dart';
import 'package:pokemondb/features/homepage/homepage.dart';

/// Implementation of [HomeRepository] class
class HomeRepositoryImpl implements HomeRepository {
  /// HomeRepositoryImpl constructor
  HomeRepositoryImpl({required this.remoteDataSource});

  /// HomeRemoteDataSource instance
  final HomeRemoteDataSource remoteDataSource;

  @override
  void fetchAccountDetails() {
    // TODO: implement fetchAccountDetails
  }

  @override
  Future<List<PokemonCard>> fetchAllPokemonCards() async {
    try {
      return remoteDataSource.fetchPokemonCards();
    } on Exception catch (error) {
      throw UnimplementedError(error.toString());
    }
  }
}
