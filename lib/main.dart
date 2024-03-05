import 'package:flutter/material.dart';
import 'app.dart';
import 'src/shared/helpers/hive_helper.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.instance.init();
  runApp(const MyApp());
}
