import 'package:dartz/dartz.dart'; // Import the Either class from the dartz package or use your custom Either class

/// Either extensioon
extension EitherExtension<L, R> on Future<Either<L, R>> {
  /// Method to handle response
  Future<void> onResponse(
    final void Function(R result) onSuccess,
    final void Function(L error) onError,
  ) async {
    final Either<L, R> either = await this;

    await either.fold(
      (final L error) async {
        onError(error);
      },
      (final R response) async {
        onSuccess(response);
      },
    );
  }
}
