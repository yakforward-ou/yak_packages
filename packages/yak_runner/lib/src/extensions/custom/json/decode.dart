import '../../../../yak_runner.dart';

/// tries to decode a `String`
extension MapSafelyDecodeX on String {
  /// returns a `Result<Map<String, Object?>>`
  Result<Map<String, Object?>> jsonDecodeAsMap() {
    final runner = JsonDecodeToMap();
    return runner(this);
  }
}

/// tries to decode a `String`
extension ListSafelyDecodeX on String {
  /// returns a `Result<List<Map<String, Object?>>`
  Result<List<Map<String, Object?>>> jsonDecodeAsList() {
    final runner = JsonDecodeToList();
    return runner(this);
  }
}
