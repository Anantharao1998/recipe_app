import 'package:dio/dio.dart';
import 'package:pokemondb/core/core.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// DioService Implementation
class DioServiceImpl implements DioClient {
  /// DioService Implementation
  DioServiceImpl({required this.dioService}) {
    // Initial Setup
    dioService
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = const Duration(
        seconds: ApiConstants.connectTimeoutInMs,
      )
      ..options.receiveTimeout = const Duration(
        seconds: ApiConstants.receiveTimeoutInMs,
      )
      ..interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
  }

  /// Dio instance
  final Dio dioService;

  @override
  Future<Response<dynamic>> delete(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
  }) =>
      dioService.delete(
        path,
        cancelToken: cancelToken,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );

  @override
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
  }) =>
      dioService.download(
        urlPath,
        savePath,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
        lengthHeader: lengthHeader,
        deleteOnError: deleteOnError,
      );

  @override
  Future<Response<dynamic>> get(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final bool authorization = true,
    final ProgressCallback? onReceiveProgress,
  }) =>
      dioService.get(
        path,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

  @override
  Future<Response<dynamic>> post(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) =>
      dioService.post(
        path,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );

  @override
  Future<Response<dynamic>> put(
    final String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) =>
      dioService.put(
        path,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
      );
}
