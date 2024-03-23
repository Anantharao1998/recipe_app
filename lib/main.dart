import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
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
          navigatorKey: navigationService.navigationKey,
          scrollBehavior: const ScrollBehavior().copyWith(
            physics: const BouncingScrollPhysics(),
          ),
          onGenerateRoute: AppRoutes.routes,
          theme: ThemeData.light(
            useMaterial3: true,
          ),
        ),
      );
}
