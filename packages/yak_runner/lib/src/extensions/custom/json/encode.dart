import '../../../../yak_runner.dart';

/// tries to encode to json a ` Map<String, Object?>`
extension MapSafelyEncodeX on Map<String, Object?> {
  /// returns a `Result<String>`
  Result<String> encode() {
    final runner = JsonEncodeFromMap();
    return runner(this);
  }
}

/// tries to encode to json a `List<Map<String, Object?>>`
extension ListSafelyEncodeX on List<Map<String, Object?>> {
  /// returns a `Result<String>`
  Result<String> encode() {
    final runner = JsonEncodeFromList();
    return runner(this);
  }
}
