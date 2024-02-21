// ignore_for_file: always_specify_types

import 'package:dartz/dartz.dart';

/// Error handling mixin
mixin ApiCallHandler {
  /// handle error based on Exception
  Future<Either<L, R>> callApiWithErrorHandler<L, R>(final Function() call) async {
    try {
      final R result = await call();

      return Right(result);
    } on Exception catch (error) {
      return Left(error as L);
    }
  }
}
