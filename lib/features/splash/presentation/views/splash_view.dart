import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/splash/splash.dart';

/// Splash View class
class SplashView extends BaseView<SplashController> {
  /// Splash View constructor
  SplashView({super.key});

  @override
  Widget body(final BuildContext context, final SplashController controller) => Column(
        children: <Widget>[
          const AssetImageView(
            fileName: AppAssets.networkLottie,
          ),
          const Text(
            'Slide Down Animation',
            style: TextStyle(fontSize: 20),
          ).slideDown(),
        ],
      );

  @override
  bool get hasAppBar => false;
}
