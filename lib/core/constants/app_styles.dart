// ignore_for_file: public_member_api_docs

import 'package:pokemondb/core/core.dart';

/// AppStyles class for use of the class
class AppStyles {
  AppStyles._();

  static const DefaultStyle h2 = DefaultStyle(
    textSize: AppValues.double_40,
    fontWeight: FontWeight.bold,
  );

  static const DefaultStyle h3 = DefaultStyle(
    textSize: AppValues.double_30,
    fontWeight: FontWeight.bold,
  );

  static const DefaultStyle h4 = DefaultStyle(
    textSize: AppValues.double_20,
    fontWeight: FontWeight.bold,
  );

  static const DefaultStyle h5 = DefaultStyle(
    textSize: AppValues.double_10,
    fontWeight: FontWeight.bold,
  );
}

/// DefaultStyle class to be used for the app.
class DefaultStyle extends TextStyle {
  /// DefaultStyle class to be used for the app.
  const DefaultStyle({
    final double? textSize,
    final Color? textColor,
    final FontWeight? fontWeight,
  }) : super(
          fontSize: textSize ?? AppValues.double_10, // Mostly used font size in the app.
          color: textColor ?? AppColors.blackPrimary, // Mostly use font color in the app.
          fontWeight: fontWeight ?? FontWeight.w500,
        );
}
