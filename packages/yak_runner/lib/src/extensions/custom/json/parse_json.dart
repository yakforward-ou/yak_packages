import '../../../../yak_runner.dart';

/// an extension that returns a `Result<T>` from a `json`
extension ParseAsJsonX<T> on Map<String, Object?> {
  /// returns a `Result<T>`
  Result<T> parseAsJson<T>(ParseJson<T> parse) {
    final runner = JsonParser(parse);
    return runner(this);
  }
}
