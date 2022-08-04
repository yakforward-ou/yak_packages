import 'dart:convert';

import 'package:yak_utils/yak_utils.dart';

import 'encoder.dart';
import 'extensions.dart';
import 'payload.dart';
import 'signature.dart';
import 'token.dart';
import 'typedefs.dart';

class ByteTokenValidator extends UnaryDelegate<ByteToken, ByteToken> {
  final BytesEncoder encoder;
  final ByteSignature signature;

  const ByteTokenValidator(
    this.signature, {
    this.encoder = const HmacEncoder(),
  });

  /// takes a [Payload] as argument and returns [Bytes]
  @override
  ByteToken call(ByteToken p0) {
    print('${base64Encode(signature(p0.payload))}');
    print('${base64Encode(p0.signature)}');

    if (p0.signature.equals(signature(p0.payload))) {
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
