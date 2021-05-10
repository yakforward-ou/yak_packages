import '../../../../yak_runner.dart';

/// tries to decode a `String`
extension MapSafelyDecodeX on String {
  /// returns a `Result<Map<String, Object?>>`
  Result<Map<String, Object?>> jsonDecodeAsMap() => JsonDecodeToMap()(this);
}

/// tries to decode a `String`
extension ListSafelyDecodeX on String {
  /// returns a `Result<List<Map<String, Object?>>`
  Result<List<Map<String, Object?>>> jsonDecodeAsList() =>
      JsonDecodeToList()(this);
}
