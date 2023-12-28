/// ApiConstants
class ApiConstants {
  ApiConstants._();

  /// Base URL
  static String baseUrl = 'https://api.pokemontcg.io/v2/';

  /// API Key
  static String apiKey = 'cf174cc6-9cd9-46d0-aa72-cd4424f25ffb';

  /// Dio connection timeout
  static const int connectTimeoutInMs = 20;

  /// Dio receive timeout
  static const int receiveTimeoutInMs = 15;
}
