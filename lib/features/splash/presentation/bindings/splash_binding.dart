import 'package:recipe_app/dependency_injection.dart';
import 'package:recipe_app/features/splash/splash.dart';

/// Splash dependencies method
void registerSplash(final GetIt getIt) {
  /// Register controller
  getIt.registerFactory(() => SplashController());
}
