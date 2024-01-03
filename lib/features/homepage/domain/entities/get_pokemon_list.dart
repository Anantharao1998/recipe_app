import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/homepage/homepage.dart';

/// This usecase gets list of Pokemons
class GetPokemonList {
  /// [GetPokemonList] constructor
  GetPokemonList({required this.repository});

  /// HomeRepository instance
  final HomeRepository repository;

  /// Calls the API and fetch the data
  Future<List<PokemonCard>> call() => repository.fetchAllPokemonCards();
}
