import 'dart:convert';

import 'package:yak_utils/yak_utils.dart';

import '../../protobufs/token.pb.dart' as buf;
import 'payload.dart';
import 'typedefs.dart';

class ByteToken {
  final Bytes signature;
  final Payload payload;

  const ByteToken({
    required this.signature,
    required this.payload,
  });

  factory ByteToken.fromBuffer(Bytes buffer) {
    final token = buf.Token.fromBuffer(buffer);
    return ByteToken(
      signature: List.unmodifiable(token.signature),
      payload: Payload.fromBuffer(token.payload),
    );
  }

  Bytes toBuffer() {
    final token = buf.Token()
      ..signature = signature
      ..payload = payload.toBuffer();
    return token.writeToBuffer();
  }

  Json toJson() => {
        'signature': base64Encode(signature),
        'payload': payload.toJson(),
      };

  @override
  String toString() => '${toJson()}';

  @override
  bool operator ==(Object other) =>
      other is ByteToken && other.hashCode == hashCode;

  @override
  int get hashCode => Object.hashAll([payload, ...signature]);
}
