import '../../../../yak_runner.dart';

/// tries to encode to json a ` Map<String, Object?>`
extension MapSafelyEncodeX on Map<String, Object?> {
  /// returns a `Result<String>`
  Result<String> encode() => JsonEncodeFromMap()(this);
}

/// tries to encode to json a `List<Map<String, Object?>>`
extension ListSafelyEncodeX on List<Map<String, Object?>> {
  /// returns a `Result<String>`
  Result<String> encode() => JsonEncodeFromList()(this);
}
