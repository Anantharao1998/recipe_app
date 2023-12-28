import 'package:dio/dio.dart';
import 'package:pokemondb/core/core.dart';

/// Interceptor to add API key to the request
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) {
    final Map<String, dynamic> headerExtra = <String, dynamic>{
      'X-Api-Key': ApiConstants.apiKey,
    };

    options.extra = headerExtra;

    handler.next(options);
  }
}
