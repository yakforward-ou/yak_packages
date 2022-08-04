import 'package:byte_token/byte_token.dart';
import 'package:test/test.dart';

import 'mocks.dart';

void main() {
  group('ByteTokenValidator', () {
    test(
        'GIVEN ByteSignature validSignature '
        'WHEN ByteTokenValidator(validSignature) '
        'THEN returns ByteTokenValidator', () {
      expect(
        ByteTokenValidator(validSignature),
        isA<ByteTokenValidator>(),
        reason: 'should return a ByteTokenValidator',
      );
    });

    test(
        'GIVEN ByteTokenValidator validator '
        'WHEN validator(validToken) '
        'THEN returns a validToken', () {
      expect(
        validator(validToken),
        validToken,
        reason: 'should return a valid token',
      );
    });
    test(
        'GIVEN ByteTokenValidator '
        'WHEN validator(badToken) '
        'THEN should throw', () {
      expect(
        () => validator(badToken),
        throwsA(isA<Exception>()),
        reason: 'should throw an exception',
      );
    });
  });
}
