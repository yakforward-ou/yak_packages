import 'dart:convert';
import 'dart:typed_data';

/// a class the convert a string to `Bytes` when instantiated
class Secret {
  final Uint8List _secret;
  final Base64Decoder decoder;

  /// secret must ahve a lenght of at least 14 and must be multiple of 4
  Secret(
    String secret, {
    this.decoder = const Base64Decoder(),
  }) : _secret = decoder.convert(secret);

  Uint8List call() => _secret;
}
