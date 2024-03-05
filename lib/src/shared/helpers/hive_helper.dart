import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelper {
  HiveHelper._();
  static final HiveHelper _instance = HiveHelper._();
  static HiveHelper get instance => _instance;
  final String defaultBox = 'storage';

  Future<void> init() async {
    if (!kIsWeb) {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
    }
    await Hive.openBox(defaultBox);
  }

  Future<void> put({
    String? box,
    required String key,
    required dynamic value,
  }) async {
    await Hive.box(box ?? defaultBox).put(key, value);
  }

  dynamic get({
    String? box,
    required String key,
  }) {
    return Hive.box(box ?? defaultBox).get(key);
  }

  Future<void> remove({
    String? box,
    required String key,
  }) async {
    await Hive.box(box ?? defaultBox).delete(key);
  }
}
