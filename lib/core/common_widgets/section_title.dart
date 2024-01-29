import 'package:flutter/material.dart';
import 'package:pokemondb/core/core.dart';

/// Common Section Title widget
class SectionTitle extends StatelessWidget {
  /// Common Section Title widget
  const SectionTitle({required this.title, this.subtitle, super.key});

  /// Section subtitle
  final String? subtitle;

  /// Section title
  final String title;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(AppValues.double_10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title),
            if (subtitle != null) Text(subtitle!),
          ],
        ),
      );
}
