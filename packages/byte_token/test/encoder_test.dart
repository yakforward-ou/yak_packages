import 'package:byte_token/byte_token.dart';
import 'package:crypto/crypto.dart';
import 'package:test/test.dart';

class HmacEncoder extends BytesEncoder {
  const HmacEncoder();
  @override
  List<int> call(p0, p1) => Hmac(sha256, p1).convert(p0).bytes;
}

void main() {
  group('HmacEncoder', () {
    final list = [for (var i = 0; i < 100; ++i) i];
    final encoder = HmacEncoder();
    test(
        'GIVEN a HmacEncoder '
        'WHEN call(Bytes,Bytes) '
        'THEN returns Bytes', () {
      expect(
        encoder(list, list),
        isA<Bytes>(),
        reason: 'should output Uint8List',
      );
    });
  });
}
