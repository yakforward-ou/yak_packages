import 'encoder.dart';
import 'extensions.dart';
import 'payload.dart';
import 'secret.dart';
import 'typedefs.dart';

/// a callable class that generates a signature [Bytes]
class ByteSignature {
  final Secret secret;
  final Encode encode;

  /// the constructor takes a [Secret] as argument
  /// default encoder is [HmacEncoder]
  ByteSignature(this.secret, {Encode? encode}) : encode = encode ?? hmacEncode;

  Bytes call(Payload p0) {
    if (p0.isExpired) {
      throw Exception('token expired\n$p0');
    }
    final payload = p0.toBuffer();
    return encode(payload, secret());
  }
}
