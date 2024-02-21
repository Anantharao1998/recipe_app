import 'package:pokemondb/core/core.dart';

/// Error handling mixin
mixin ErrorHandler {
  /// handle error based on Exception
  ViewState handleError(final Exception exception) => ViewState.success;
}
