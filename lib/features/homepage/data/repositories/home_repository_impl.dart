import 'package:pokemondb/features/homepage/homepage.dart';

/// Implementation of [HomeRepository] class
class HomeRepositoryImpl implements HomeRepository {
  /// HomeRepositoryImpl constructor
  HomeRepositoryImpl({required this.remoteDataSource});

  /// HomeRemoteDataSource instance
  final HomeRemoteDataSource remoteDataSource;

  @override
  void fetchAccountDetails() => throw UnimplementedError();

  @override
  Future<List<dynamic>> fetchAllPokemonCards() => throw UnimplementedError();
}
