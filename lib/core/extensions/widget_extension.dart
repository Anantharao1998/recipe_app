// ignore_for_file: public_member_api_docs

import 'package:pokemondb/core/core.dart';
import 'package:provider/provider.dart';

/// Container extensions
extension WidgetExtension on Widget {
  Widget underlined() => Column(
        children: <Widget>[
          this,
          const Divider(
            height: AppValues.double_0,
          ),
        ],
      );

  Widget onTap({
    final Function()? onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: this,
      );

  Widget listen<T2 extends ChangeNotifier, T>(final T2 provider, final T variable) => Selector<T2, T>(
        builder: (final BuildContext context, final T value, final _) => this,
        selector: (final _, final T2 provider) => variable,
      );
}
