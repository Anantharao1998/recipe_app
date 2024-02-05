import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/dependency_injection.dart';

void main() async {
  // init dependency injection
  await init();

  runApp(const MyApp());
}

/// MyApp
class MyApp extends StatelessWidget {
  /// MyApp
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) => ScreenUtilInit(
        builder: (final BuildContext context, final Widget? child) => MaterialApp(
          navigatorKey: NavigationService().navigationKey,
          onGenerateRoute: AppRoutes.routes,
          theme: ThemeData(
            useMaterial3: true,
          ),
        ),
      );
}
