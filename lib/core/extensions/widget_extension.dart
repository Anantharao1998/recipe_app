import 'package:recipe_app/core/core.dart';

/// Container extensions
extension WidgetExtension on Widget {
  /// Give underline to a widget
  Widget underlined() => Column(
        children: <Widget>[
          this,
          const Divider(
            height: AppValues.double_0,
          ),
        ],
      );

  /// Adds onTap callback to a widget
  Widget onTap({
    final Function()? onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: this,
      );
}
