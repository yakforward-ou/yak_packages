import 'package:byte_token/byte_token.dart';
import 'package:test/test.dart';

void main() {
  group('HmacEncoder', () {
    final list = [for (var i = 0; i < 100; ++i) i];

    test(
        'GIVEN a HmacEncoder '
        'WHEN call(Bytes,Bytes) '
        'THEN returns Bytes', () {
      expect(
        hmacEncode(list, list),
        isA<Bytes>(),
        reason: 'should output Uint8List',
      );
    });
  });
}
