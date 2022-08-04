import 'package:byte_token/byte_token.dart';
import 'package:test/test.dart';

import 'mocks.dart';

void main() {
  group('Signature', () {
    final secret = Secret(
      'eyJ1c2VySWQiOiJhYmNkMTIzIiwiZXhwaXJ5IjoxNjQ2NjM1NjExMzAx',
    );
    final signature = ByteSignature(secret);
    final validPayload = Payload(
      email: 'yakforward@gmail.com',
      emailVerified: true,
      issuedAt: aYearAgo,
      expirationTime: tomorrow,
    );

    final expiredPayload = Payload(
      email: 'yakforward@gmail.com',
      emailVerified: true,
      issuedAt: aYearAgo,
      expirationTime: yesterday,
    );
    test(
        'GIVEN Bytes secret() '
        'WHEN ByteSignature(secret()) '
        'THEN returns ByteSignature', () {
      expect(
        ByteSignature(secret),
        isA<ByteSignature>(),
        reason: 'should output ByteSignature',
      );
    });

    test(
        'GIVEN a Signature '
        'WHEN call(Payload) '
        'THEN returns Bytes', () {
      expect(
        signature(validPayload),
        isA<Bytes>(),
        reason: 'should output Bytes',
      );
    });
    test(
        'GIVEN a Signature '
        'WHEN call(expired payload) '
        'THEN should throw', () {
      expect(
        () => signature(expiredPayload),
        throwsException,
        reason: 'should throw',
      );
    });

    test(
        'GIVEN 2 signatures identical signatures '
        'WHEN call(Payload) '
        'THEN returns the same data', () {
      expect(
        signature(validPayload).equals(signature(validPayload)),
        isTrue,
        reason: 'should be identical',
      );
    });
  });
}
