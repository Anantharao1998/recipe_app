// ignore_for_file: public_member_api_docs

import 'package:recipe_app/core/core.dart';

mixin SnackBarHelper {
  final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

  void removeSnackBar(final BuildContext context) {
    snackbarKey.currentState?.removeCurrentSnackBar();
  }

  Widget showErrorSnackBar(final String message) {
    final SnackBar snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    WidgetsBinding.instance.addPostFrameCallback((final __) {
      ScaffoldMessenger.of(navigationService.navigationKey.currentContext!).showSnackBar(snackBar);
    });

    return Container();
  }

  void removeErrorSnackBar(final BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }

  void showSuccessSnackBar(final BuildContext context, {final String? message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('SUCCESS'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 10),
      ),
    );
  }

  void showWarningSnackBar(final BuildContext context, {final String? message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? ''),
        backgroundColor: Colors.orange,
        duration: const Duration(
          seconds: 18,
        ),
      ),
    );
  }

  void showNoInternetSnackBar({final String? message}) {
    ScaffoldMessenger.of(navigationService.navigationKey.currentContext!).removeCurrentSnackBar();
    ScaffoldMessenger.of(navigationService.navigationKey.currentContext!).showSnackBar(
      SnackBar(
        margin: EdgeInsets.zero,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message ?? AppStrings.noInternetConnection,
          style: AppStyles.norm_6.copyWith(fontWeight: FontWeight.w600, color: AppColors.whitePrimary),
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.redPrimary,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void removeShowNoInternetSnackBar(final BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
}
