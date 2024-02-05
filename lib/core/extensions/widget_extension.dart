// ignore_for_file: public_member_api_docs

import 'package:pokemondb/core/core.dart';

/// Container extensions
extension WidgetExtension on Widget {
  Widget onTap({
    final Function()? onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: this,
      );
}
