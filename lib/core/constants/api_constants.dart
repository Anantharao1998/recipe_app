/// ApiConstants
class ApiConstants {
  ApiConstants._();

  /// Base URL
  static String baseUrl = 'https://pokeapi.co/api/v2/';

  /// Dio connection timeout
  static const int connectTimeoutInMs = 20;

  /// Dio receive timeout
  static const int receiveTimeoutInMs = 15;
}
