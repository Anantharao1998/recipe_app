// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';
import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/dependency_injection.dart';
// TODO [Anantha]: Remove unnecessary methods

/// HomeRemoteDataSource
abstract class HomeRemoteDataSource {
  /// fetch all pokemon cards
  Future<List<PokemonCardModel>> fetchPokemonCards();

  /// Fetch account details
  void fetchAccountDetails();
}

/// Implementation of [HomeRemoteDataSource]

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  void fetchAccountDetails() => throw UnimplementedError();

  @override
  Future<List<PokemonCardModel>> fetchPokemonCards() async {
    final DioClient dio = DioServiceImpl(dioService: locator());

    final Response<dynamic> response = await dio.get(ApiConstants.cards);

    return ((response.data as Map<String, dynamic>)['data'] as List<dynamic>)
        .map((final e) => PokemonCardModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
