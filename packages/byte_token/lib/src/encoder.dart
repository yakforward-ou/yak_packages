import 'package:byte_token/byte_token.dart';
import 'package:crypto/crypto.dart';

class HmacEncoder extends BytesEncoder {
  const HmacEncoder();
  @override
  List<int> call(p0, p1) => Hmac(sha256, p1).convert(p0).bytes;
}
