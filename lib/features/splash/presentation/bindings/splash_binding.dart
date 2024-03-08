import 'package:pokemondb/dependency_injection.dart';
import 'package:pokemondb/features/splash/splash.dart';

/// Splash dependencies method
void registerSplash(final GetIt getIt) {
  /// Register controller
  getIt.registerFactory(() => SplashController());
}
