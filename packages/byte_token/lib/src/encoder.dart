import 'package:byte_token/byte_token.dart';
import 'package:crypto/crypto.dart';

Bytes hmacEncode(Bytes p0, Bytes p1) => Hmac(sha256, p1).convert(p0).bytes;
