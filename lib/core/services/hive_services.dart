// ignore_for_file: public_member_api_docs, always_specify_types, type_annotate_public_apis

import 'dart:async';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  final Completer<Box> _completer = Completer<Box>();

  Future<void> initHive() async {
    await _box;
  }

  Future<Box> get _box async {
    if (!_completer.isCompleted) {
      final Directory appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
      final Box box = await Hive.openBox('myBox');
      _completer.complete(box);
    }
    return _completer.future;
  }

  Future<List<dynamic>> fetchData() async {
    final Box box = await _box;
    return box.values.toList();
  }

  Future<void> insertData(final data) async {
    final Box box = await _box;
    await box.add(data);
  }

  Future<void> updateData(final int index, final newData) async {
    final Box box = await _box;
    await box.putAt(index, newData);
  }

  Future<void> deleteData(final int index) async {
    final box = await _box;
    await box.deleteAt(index);
  }
}
