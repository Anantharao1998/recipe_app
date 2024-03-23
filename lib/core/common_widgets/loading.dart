// ignore_for_file: public_member_api_docs

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:recipe_app/core/core.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(final BuildContext context) => PopScope(
        canPop: false,
        child: Stack(
          children: <Widget>[
            Container(
              color: AppColors.greyPrimary.withOpacity(0.7),
              height: double.infinity,
              width: double.infinity,
            ),
            Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.primaryColor,
                size: AppValues.double_50,
              ),
            ),
          ],
        ),
      );
}
