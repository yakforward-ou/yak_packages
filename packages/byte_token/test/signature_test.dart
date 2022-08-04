import 'package:byte_token/byte_token.dart';
import 'package:test/test.dart';

import 'mocks.dart';

void main() {
  group('Signature', () {
    test(
        'GIVEN Bytes secret() '
        'WHEN ByteSignature(secret()) '
        'THEN returns ByteSignature', () {
      expect(
        ByteSignature(validSecret),
        isA<ByteSignature>(),
        reason: 'should output ByteSignature',
      );
    });

    test(
        'GIVEN a Signature '
        'WHEN call(Payload) '
        'THEN returns Bytes', () {
      expect(
        validSignature(validPayload),
        isA<Bytes>(),
        reason: 'should output Bytes',
      );
    });
    test(
        'GIVEN a Signature '
        'WHEN call(expired payload) '
        'THEN should throw', () {
      expect(
        () => validSignature(expiredPayload),
        throwsException,
        reason: 'should throw',
      );
    });

    test(
        'GIVEN 2 signatures identical signatures '
        'WHEN call(Payload) '
        'THEN returns the same data', () {
      expect(
        validSignature(validPayload).equals(validSignature(validPayload)),
        isTrue,
        reason: 'should be identical',
      );
    });
  });
}
