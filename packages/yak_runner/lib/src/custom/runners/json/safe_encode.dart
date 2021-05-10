import 'dart:convert';

import '../../../../yak_runner.dart';

/// a `UnaryRunner` that safely run `jsonEncode`
class JsonEncodeFromMap extends UnaryRunner<String, Map<String, Object?>> {
  /// has no parameters
  JsonEncodeFromMap()
      : super(
          jsonEncode,
          errorHandlers: {TypeError().silent},
        );
}

/// a `UnaryRunner` that safely run `jsonEncode`
class JsonEncodeFromList
    extends UnaryRunner<String, List<Map<String, Object?>>> {
  /// has no parameters
  JsonEncodeFromList()
      : super(
          jsonEncode,
          errorHandlers: {TypeError().silent},
        );
}
