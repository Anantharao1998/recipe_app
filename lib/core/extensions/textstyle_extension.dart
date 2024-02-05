// ignore_for_file: public_member_api_docs

import 'package:pokemondb/core/core.dart';

/// TextStyle extension
extension TextStyleExtension on TextStyle {
  TextStyle white() => copyWith(color: AppColors.whitePrimary);
  TextStyle cyan() => copyWith(color: AppColors.primaryColor);
  TextStyle red() => copyWith(color: AppColors.redPrimary);
  TextStyle black() => copyWith(color: AppColors.blackPrimary);
  TextStyle green() => copyWith(color: AppColors.greenPrimary);
  TextStyle blue() => copyWith(color: AppColors.bluePrimary);
  TextStyle grey() => copyWith(color: AppColors.greyPrimary);
}
