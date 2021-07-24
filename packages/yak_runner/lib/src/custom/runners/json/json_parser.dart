import 'package:yak_error_handler/yak_error_handler.dart';

import '../../../../yak_runner.dart';

/// a `UnaryRunner` that returns a T from a Json
class JsonParser<T> extends UnaryRunner<T, Map<String, Object?>> {
  /// takes as constructor a `ParseJson` function and an optional `handleError`
  JsonParser(ParseJson<T> parse)
      : super(parse, errorHandlers: {TypeError().silent});
}
