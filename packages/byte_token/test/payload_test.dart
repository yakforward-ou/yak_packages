import 'package:byte_token/byte_token.dart';
import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

import 'mocks.dart';

void main() {
  group('Payload', () {
    test(
        'GIVEN identical Payload '
        'WHEN compared for equality '
        'THEN returns true', () {
      final tester = validPayload;
      expect(
        tester == validPayload,
        isTrue,
        reason: 'equality should be true',
      );
    });
    test(
        'GIVEN different Payload '
        'WHEN compared for equality '
        'THEN returns false', () {
      expect(
        validPayload == badPayload,
        isFalse,
        reason: 'equality should be false',
      );
    });

    test(
        'GIVEN List<int> from Payload toBuffer '
        'WHEN when Payload.fromBuffer() '
        'THEN then returns the same Payload', () {
      expect(
        Payload.fromBuffer(validPayload.toBuffer()) == validPayload,
        isTrue,
        reason: 'Payload from token should be identical',
      );
    });
    test(
        'GIVEN a Payload  '
        'WHEN when toJson() '
        'THEN then returns a Json', () {
      expect(
        validPayload.toJson(),
        isA<Json>(),
        reason: 'should return a json',
      );
    });

    test(
        'GIVEN a Payload  '
        'WHEN when toJson() '
        'THEN output is predicatable', () {
      final json = validPayload.toJson();
      expect(
        (json['iss'] as String?) == validPayload.issuer,
        isTrue,
        reason: '"iss" should match "issuer"',
      );
      expect(
        (json['azp'] as String?) == validPayload.authorizedParty,
        isTrue,
        reason: '"azp" should match "authorizedParty"',
      );
      expect(
        (json['aud'] as String?) == validPayload.audience,
        isTrue,
        reason: '"aud" should match "audience"',
      );
      expect(
        (json['sub'] as String?) == validPayload.subject,
        isTrue,
        reason: '"sub" should match "subject"',
      );
      expect(
        (json['at_hash'] as String?) == validPayload.accessTokenHashValue,
        isTrue,
        reason: '"at_hash" should match "accessTokenHashValue"',
      );
      expect(
        (json['email'] as String?) == validPayload.email,
        isTrue,
        reason: '"email" should match "email"',
      );
      expect(
        (json['email_verified'] as String) ==
            validPayload.emailVerified.toString(),
        isTrue,
        reason: '"email_verified" should match "emailVerified"',
      );
      expect(
        (json['iat'] as int?) == validPayload.issuedAt,
        isTrue,
        reason: '"iat" should match "issuedAt"',
      );
      expect(
        (json['exp'] as int?) == validPayload.expirationTime,
        isTrue,
        reason: '"exp" should match "expirationTime"',
      );
      expect(
        (json['nonce'] as String?) == validPayload.nonce,
        isTrue,
        reason: '"nonce" should match "nonce"',
      );
      expect(
        (json['hd'] as String?) == validPayload.hostedDomain,
        isTrue,
        reason: '"hd" should match "hostedDomain"',
      );
    });

    test(
        'GIVEN a Payload  '
        'WHEN when toString() '
        'THEN then returns a String', () {
      expect(
        validPayload.toString(),
        isA<String>(),
        reason: 'should return a json',
      );
    });
  });
}
