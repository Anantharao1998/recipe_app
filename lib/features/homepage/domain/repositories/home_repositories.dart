import 'package:pokemondb/core/core.dart';

/// HomeRepository
abstract class HomeRepository {
  /// Fetches all pokemon cards
  Future<List<PokemonCard>> fetchAllPokemonCards();

  /// Fetch account details of the user
  void fetchAccountDetails();
}
