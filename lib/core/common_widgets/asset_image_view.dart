// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class AssetImageView extends StatelessWidget {
  const AssetImageView({
    required this.fileName,
    this.height,
    this.fit,
    this.width,
    this.color,
    this.scale,
    this.alignment,
    this.opacity,
    this.reverseLottie = true,
    super.key,
  });

  final AlignmentGeometry? alignment;
  final Color? color;
  final String fileName;
  final BoxFit? fit;
  final double? height;
  final double? opacity;
  final bool? reverseLottie;
  final double? scale;
  final double? width;

  Widget _getView() {
    final String mimType = fileName.split('.').last;

    return mimType.isEmpty
        ? Icon(Icons.image_not_supported_outlined, size: width, color: color)
        : Opacity(
            opacity: opacity ?? 1,
            child: _buildImageView(mimType),
          );
  }

  Widget _buildImageView(final String mimType) {
    switch (mimType) {
      case 'svg':
        return SvgPicture.asset(
          fileName,
          height: height,
          width: width,
          alignment: alignment ?? Alignment.center,
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
      case 'png':
      case 'jpg':
      case 'jpeg':
        return Image.asset(
          fileName,
          fit: fit,
          height: height,
          width: width,
          alignment: alignment ?? Alignment.center,
          color: color,
          scale: scale,
        );
      case 'json':
      case 'zip':
        return Lottie.asset(
          fileName,
          width: width,
          height: height,
          repeat: true,
          reverse: reverseLottie,
        );
      default:
        return Icon(
          Icons.image_not_supported_outlined,
          size: width,
          color: color,
        );
    }
  }

  @override
  Widget build(final BuildContext context) => _getView();
}
