import 'package:flutter/material.dart';
import 'package:pokemondb/core/constants/app_styles.dart';

/// SingleButton widget
class SingleButton extends StatelessWidget {
  /// SingleButton widget
  const SingleButton({required this.buttonName, this.onPressed, super.key});

  /// onPressed callback
  final Function()? onPressed;

  /// button name
  final String buttonName;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: AppStyles.italic_5,
        ),
      );
}
