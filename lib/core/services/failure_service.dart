// ignore_for_file: public_member_api_docs

import 'package:logger/logger.dart';

abstract class Failure {
  Failure({required this.message, this.statusCode});

  final String message;
  final int? statusCode;

  String get detailedMessage;

  /// returning current class name as error type
  String get errorType => runtimeType.toString();
}

/// Throw if body string return is in valid json format, which cause it has the issue when trying to decode
/// Mostly will be thrown at data layer.
class JsonFormatFailure extends Failure {
  JsonFormatFailure({required super.message});

  @override
  String get detailedMessage => '$message [err: json_err]';
}

/// Mobile is not connecting to wifi or data connection
class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure({final String? message}) : super(message: message ?? 'No internet connection');

  @override
  String get detailedMessage => message;
}

class HandshakeFailure extends Failure {
  HandshakeFailure({final String? message}) : super(message: message ?? 'Handshake failed');

  @override
  String get detailedMessage => message;
}

/// Thrown if server http status is 5xx
class InternalServerFailure extends Failure {
  InternalServerFailure({
    required super.message,
    super.statusCode,
  });

  @override
  String get detailedMessage => '$message [statusCode: ${statusCode ?? 0}]';
}

/// Thrown if the status code return is not being handled
class UnhandledServerFailure extends Failure {
  UnhandledServerFailure({required super.message, required this.stackTrace, super.statusCode = 0});

  final StackTrace? stackTrace;

  final Logger _logger = Logger();

  @override
  String get detailedMessage {
    _logger.e('Stacktrace: >>>>>>> $stackTrace');

    return '$message\n[statusCode: $statusCode]';
  }
}

/// Thrown if some exception is not being handle properly
class UnhandledFailure extends Failure {
  UnhandledFailure({required this.exceptionName, required super.message});

  final String exceptionName;

  @override
  String get detailedMessage => message;
}

class ApiFailure extends Failure {
  ApiFailure({required super.message, required super.statusCode});

  @override
  // String get detailedMessage => '$message \nStatusCode:[$statusCode]';
  String get detailedMessage => message;
}

class ServiceUnavilableFailure extends Failure {
  ServiceUnavilableFailure({required super.message, super.statusCode});

  @override
  String get detailedMessage => message;
}

class ForbiddenFailure extends Failure {
  ForbiddenFailure({required super.message, super.statusCode});

  @override
  String get detailedMessage => message;
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({required super.message, super.statusCode});

  @override
  String get detailedMessage => message;
}

class TimeoutFailure extends Failure {
  TimeoutFailure({required super.message});

  @override
  String get detailedMessage => message;
}

class BadCertificateFailure extends Failure {
  BadCertificateFailure({required super.message, super.statusCode});

  @override
  String get detailedMessage => message;
}

class BadResponseFailure extends Failure {
  BadResponseFailure({required super.message, super.statusCode});

  @override
  String get detailedMessage => message;
}

class CancellationFailure extends Failure {
  CancellationFailure({required super.message, super.statusCode});

  @override
  String get detailedMessage => message;
}

class BadRequestFailure extends Failure {
  BadRequestFailure({required super.message, super.statusCode});

  @override
  String get detailedMessage => message;
}

class NotFoundFailure extends Failure {
  NotFoundFailure({required super.message, super.statusCode});

  @override
  String get detailedMessage => message;
}

class CustomFailure extends Failure {
  CustomFailure({required super.message, super.statusCode});

  @override
  String get detailedMessage => message;
}
