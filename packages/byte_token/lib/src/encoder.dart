import 'package:byte_token/byte_token.dart';
import 'package:crypto/crypto.dart';

/// encodes [Bytes] using [Hmac]
class HmacEncoder extends BytesEncoder {
  const HmacEncoder();

  /// takes two parameters
  /// first: the `input` to sign
  /// second the `secret key`
  @override
  Bytes call(p0, p1) => Hmac(sha256, p1).convert(p0).bytes;
}
