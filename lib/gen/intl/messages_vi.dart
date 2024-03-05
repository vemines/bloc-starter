// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  static String m0(param) => "Param truyền vào là ${param}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("Bloc Starter"),
        "cancelButtonTitle": MessageLookupByLibrary.simpleMessage("Hủy"),
        "darkThemeTitle": MessageLookupByLibrary.simpleMessage("Dark Theme"),
        "experimentalThemeTitle":
            MessageLookupByLibrary.simpleMessage("Experimental Theme"),
        "hello": MessageLookupByLibrary.simpleMessage("Xin chào"),
        "lightThemeTitle": MessageLookupByLibrary.simpleMessage("Light Theme"),
        "param": m0,
        "systemThemeTitle":
            MessageLookupByLibrary.simpleMessage("System Theme"),
        "tabHome": MessageLookupByLibrary.simpleMessage("Trang chủ"),
        "tabSettings": MessageLookupByLibrary.simpleMessage("Cài Đặt"),
        "tabTheme": MessageLookupByLibrary.simpleMessage("Giao Diện"),
        "themeTitle": MessageLookupByLibrary.simpleMessage("Theme"),
        "yellowThemeTitle": MessageLookupByLibrary.simpleMessage("Yellow Theme")
      };
}
