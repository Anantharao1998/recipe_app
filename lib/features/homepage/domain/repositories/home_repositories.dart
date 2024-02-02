// TODO [Anantha]: delete unnecessary methods

/// HomeRepository
abstract class HomeRepository {
  /// Fetches all pokemon cards
  Future<List<dynamic>> fetchAllPokemonCards();

  /// Fetch account details of the user
  void fetchAccountDetails();
}
