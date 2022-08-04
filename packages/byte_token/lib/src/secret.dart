import 'dart:convert';
import 'dart:typed_data';

import 'package:yak_utils/yak_utils.dart';

class Secret extends NullaryDelegate<Uint8List> {
  final Uint8List _secret;
  final Base64Decoder decoder;

  /// secret must ahve a lenght of at least 14 and must be multiple of 4
  Secret(
    String secret, {
    this.decoder = const Base64Decoder(),
  }) : _secret = decoder.convert(secret);

  @override
  Uint8List call() => _secret;
}
