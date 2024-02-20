import 'package:pokemondb/core/core.dart';

/// Base controller for the app
abstract class BaseController extends ChangeNotifier {
  ViewState _viewState = ViewState.initial;

  /// Gets screen viewstate
  ViewState get viewState => _viewState;

  /// Loading screenstate
  void setLoading() => _updateViewState(ViewState.loading);

  /// Success screenstate

  void setSuccess() => _updateViewState(ViewState.success);

  /// NoInternet screenstate
  void setNoInternet() => _updateViewState(ViewState.noInternet);

  void _updateViewState(final ViewState state) {
    if (state != _viewState) {
      _viewState = state;

      notifyListeners();
    }
  }
}
