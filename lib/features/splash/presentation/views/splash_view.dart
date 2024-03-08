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
            'Welcome to BizApp',
            style: TextStyle(fontSize: 20),
          ).slideDown(),
          const Spacer(),
          SingleButton(
            buttonName: 'Go to Home',
            onPressed: () async => navigationService.navigateTo(Routes.home),
          ),
          const SizedBox(
            height: AppValues.double_10,
          ),
        ],
      );

  @override
  bool get hasAppBar => false;
}
