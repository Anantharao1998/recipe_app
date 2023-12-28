import 'package:dio/dio.dart';

/// DioClient abstract class
abstract class DioClient {
  /// Get method
  Future<Response<dynamic>> get(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  });

  /// Post method
  Future<Response<dynamic>> post(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  });

  /// Download method
  Future<Response<dynamic>> download(
    final String urlPath,
    final String savePath, {
    final ProgressCallback? onReceiveProgress,
    final Map<String, dynamic>? queryParameters,
    final CancelToken? cancelToken,
    final bool deleteOnError = true,
    final String lengthHeader = Headers.contentLengthHeader,
    final Object? data,
    final Options? options,
  });

  /// Put method
  Future<Response<dynamic>> put(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  });

  /// Delete method
  Future<Response<dynamic>> delete(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
  });
}
