/// ApiConstants
class ApiConstants {
  ApiConstants._();

  /// API Key
  static String apiKey = 'cf174cc6-9cd9-46d0-aa72-cd4424f25ffb';

  /// Base URL
  static String baseUrl = 'https://api.pokemontcg.io/v2/';

  /// Endpoint for cards
  static const String cards = '/cards';

  /// Dio connection timeout
  static const int connectTimeoutInMs = 20;

  /// Dio receive timeout
  static const int receiveTimeoutInMs = 15;
}
