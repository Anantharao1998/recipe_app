// ignore_for_file: public_member_api_docs

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pokemondb/core/core.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(final BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: AppColors.whitePrimary,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Center(
                child: AssetImageView(
                  fileName: AppAssets.backgroundImage,
                  height: AppValues.double_100,
                  width: AppValues.double_100,
                ),
              ),
              const SizedBox(
                height: AppValues.double_20,
              ),
              LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.primaryColor,
                size: AppValues.double_50,
              ),
            ],
          ),
        ),
      );
}
