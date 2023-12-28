import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// General Image View
class ImageView extends StatelessWidget {
  /// General Image View
  const ImageView({required this.imagePath, super.key});

  /// General Image View
  final String imagePath;

  @override
  Widget build(final BuildContext context) {
    if (imagePath.contains('http')) {
      return CachedNetworkImage(imageUrl: imagePath);
    }

    return const Icon(Icons.image_not_supported_outlined);
  }
}
