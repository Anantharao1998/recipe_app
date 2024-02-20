/// Base UseCase
abstract class BaseUseCase<Params> {
  /// API call
  void call(final Params data);

  /// Cancel API call
  void cancel() {}
}
