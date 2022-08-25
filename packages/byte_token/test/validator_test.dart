import 'package:byte_token/byte_token.dart';
import 'package:test/test.dart';

void main() {
  group('ByteTokenValidator', () {
    const oneDay = Duration(days: 1);
    const oneYear = Duration(days: 365);
    final aYearAgo =
        DateTime.now().toUtc().add(-oneYear).millisecondsSinceEpoch;

    final tomorrow = DateTime.now().toUtc().add(oneDay).millisecondsSinceEpoch;

    final secret = Secret(
      'eyJ1c2VySWQiOiJhYmNkMTIzIiwiZXhwaXJ5IjoxNjQ2NjM1NjExMzAx',
    );
    final signature = ByteSignature(secret);

    final validator = ByteTokenValidator(signature);
    final payload = Payload(
      email: 'yakforward@gmail.com',
      emailVerified: true,
      issuedAt: aYearAgo,
      expirationTime: tomorrow,
    );

    final token = ByteToken(
      payload: payload,
      signature: signature(payload),
    );

    final badToken = ByteToken(
      payload: Payload(
        email: 'bad_actor@gmail.com',
        emailVerified: true,
        issuedAt: aYearAgo,
        expirationTime: tomorrow,
      ),
      signature: signature(payload),
    );
    test(
        'GIVEN ByteSignature signature '
        'WHEN ByteTokenValidator(signature) '
        'THEN returns ByteTokenValidator', () {
      expect(
        ByteTokenValidator(signature),
        isA<ByteTokenValidator>(),
        reason: 'should return a ByteTokenValidator',
      );
    });

    test(
        'GIVEN ByteTokenValidator validator '
        'WHEN validator(token) '
        'THEN returns a token', () {
      expect(
        validator(token),
        token,
        reason: 'should return a valid token',
      );
    });
    test(
        'GIVEN ByteTokenValidator '
        'WHEN validator(badToken) '
        'THEN should throw', () {
      expect(
        () => validator(badToken),
        throwsException,
        reason: 'should throw an exception',
      );
    });
  });
}
