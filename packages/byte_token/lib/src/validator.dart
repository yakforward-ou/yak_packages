import 'package:yak_utils/yak_utils.dart';

import '../byte_token.dart';

/// a callable class that validates a [ByteToken]
class ByteTokenValidator {
  final Encode encode;
  final ByteSignature signature;

  /// it requires a [ByteSignature] and defaults the encoder to [HmacEncoder]
  ByteTokenValidator(this.signature, {Encode? encode})
      : encode = encode ?? hmacEncode;

  /// takes a [ByteToken] as argument and returns it if valid
  ByteToken call(ByteToken p0) {
    if (!p0.signature.equals(signature(p0.payload))) {
      throw Exception('signature not valid for $p0');
    }
    if (p0.payload.expirationTime == null) {
      throw Exception('invalid token expiration time\n$p0');
    }
    if (p0.payload.expirationTime! <
        DateTime.now().toUtc().millisecondsSinceEpoch) {
      throw Exception('token expired\n$p0');
    }
    return p0;
  }
}
