import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

/// Image Utils.
class ImageUtils {
  ImageUtils._();

  /// Creates asset path to given xFile.
  static Future<String> saveImageAsAsset(final XFile xFile) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String imagePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
    final File imageFile = File(imagePath);
    final List<int> byteData = await xFile.readAsBytes();
    await imageFile.writeAsBytes(byteData);

    // Return the image path
    return imagePath;
  }

  /// Save
  static Future<XFile> getsXFileFromAsset(final String path) async {
    // Load the image as an asset
    final ByteData byteData = await rootBundle.load(path);
    final Uint8List bytes = byteData.buffer.asUint8List();

    final XFile image = XFile.fromData(bytes);
    // Return the asset key
    return image;
  }
}
