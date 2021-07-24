import 'dart:convert';
import 'package:yak_error_handler/yak_error_handler.dart';

import '../../../../yak_runner.dart';

/// a `UnaryRunner` that safely run `jsonDecode`
class JsonDecodeToMap extends UnaryRunner<Map<String, Object?>, String> {
  /// has no parameters
  JsonDecodeToMap()
      : super(
          (json) => jsonDecode(json) as Map<String, Object?>,
          errorHandlers: {TypeError().silent},
        );
}

/// a `UnaryRunner` that safely run `jsonDecode`
class JsonDecodeToList extends UnaryRunner<List<Map<String, Object?>>, String> {
  /// has no parameters
  JsonDecodeToList()
      : super(
          (json) {
            return [
              for (final d in jsonDecode(json) as List<dynamic>)
                d as Map<String, Object?>
            ];
          },
          errorHandlers: {TypeError().silent},
        );
}
