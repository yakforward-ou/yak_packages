import 'dart:convert';

import 'package:yak_utils/yak_utils.dart';

import '../../protobufs/token.pb.dart' as buf;
import 'payload.dart';
import 'typedefs.dart';

/// a class that stores a signature as [Bytes] and a [Payload]
class ByteToken {
  final Bytes signature;
  final Payload payload;

  /// base constant constructor
  const ByteToken({
    required this.signature,
    required this.payload,
  });

  /// a factory constructor from  binary data
  factory ByteToken.fromBuffer(Bytes buffer) {
    final token = buf.Token.fromBuffer(buffer);
    return ByteToken(
      signature: List.unmodifiable(token.signature),
      payload: Payload.fromBuffer(token.payload),
    );
  }

  /// converts the object to binary data
  Bytes toBuffer() {
    final token = buf.Token()
      ..signature = signature
      ..payload = payload.toBuffer();
    return token.writeToBuffer();
  }

  /// outputs a map compatible with jsonEncode
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
