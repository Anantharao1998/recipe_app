import 'package:recipe_app/core/core.dart';

/// Common Section Title widget
class SectionTitle extends StatelessWidget {
  /// Common Section Title widget
  const SectionTitle({this.title, this.subtitle, this.onPressed, super.key});

  /// OnPressed button for (+).
  final Function()? onPressed;

  /// Section subtitle
  final String? subtitle;

  /// Section title
  final String? title;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(AppValues.double_10),
        child: Row(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (title != null)
                  Text(
                    title!,
                    style: AppStyles.h4,
                  ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: AppStyles.h5.grey(),
                  ),
              ],
            ),
            const Spacer(),
            if (onPressed != null) IconButton(onPressed: onPressed, icon: const Icon(Icons.add_sharp)),
          ],
        ),
      );
}
