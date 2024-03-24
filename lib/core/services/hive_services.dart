import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_app/core/core.dart';

/// Hive services handles local database
class HiveServices {
  /// Init hive services
  Future<void> initHive() async {
    final Directory documentDir = await getApplicationDocumentsDirectory();

    try {
      Hive.init(documentDir.path);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  /// Creates a HiveBox and returns the instance. Existing instance if already created.
  Future<LazyBox<T>?> createBox<T extends Map<String, dynamic>>(final String boxName) async {
    try {
      return await Hive.openLazyBox<T>(boxName);
    } on Exception catch (error) {
      debugPrint(error.toString());

      return null;
    }
  }

  /// Puts item in the box.
  Future<void> putInBox<T>({
    required final String boxName,
    required final Map<String, dynamic> item,
    required final String key,
  }) async {
    final LazyBox<Map<String, dynamic>>? currentBox = await createBox(boxName);

    await currentBox?.put(key, item);
  }

  /// Fetch Map from given box.
  Future<Map<String, dynamic>?> getFromBox({
    required final String boxName,
    required final String key,
  }) async {
    final LazyBox<Map<String, dynamic>>? currentBox = await createBox(boxName);

    return await currentBox?.get(key);
  }
}
