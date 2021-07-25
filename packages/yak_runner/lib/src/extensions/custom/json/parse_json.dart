import 'package:yak_result/yak_result.dart';

import '../../../all.dart';

/// an extension that returns a `Result<T>` from a `json`
extension ParseAsJsonX on Map<String, Object?> {
  /// returns a `Result<T>`
  Result<T> parseAsJson<T>(ParseJson<T> parse) {
    final runner = JsonParser(parse);
    return runner(this);
  }
}
