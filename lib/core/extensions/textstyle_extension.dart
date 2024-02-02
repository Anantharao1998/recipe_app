// ignore_for_file: public_member_api_docs

import 'package:pokemondb/core/core.dart';

/// TextStyle extension
extension TextStyleExtension on TextStyle {
  TextStyle white() => copyWith(color: AppColors.whitePrimary);
  TextStyle cyan() => copyWith(color: AppColors.cyanPrimary);
}
