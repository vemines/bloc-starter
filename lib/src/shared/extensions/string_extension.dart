import 'package:flutter/foundation.dart';

extension WebAdapter on String {
  /// assets folder in web is in assets folder, it not affect in debug mode
  /// but will cause 404 when build. prefixAssets() will add "assets/" if is
  /// web and on release mode
  String prefixAssets() => kIsWeb && kReleaseMode ? "assets/$this" : this;
}
