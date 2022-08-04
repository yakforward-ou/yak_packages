import 'dart:convert';

import 'package:byte_token/byte_token.dart';
import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

import 'mocks.dart';

void main() {
  group('ByteToken', () {
    final secret = Secret(
      'eyJ1c2VySWQiOiJhYmNkMTIzIiwiZXhwaXJ5IjoxNjQ2NjM1NjExMzAx',
    );
    final signature = ByteSignature(secret);
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

    final badPayload = Payload(
      email: 'bad_actor@gmail.com',
      emailVerified: true,
      issuedAt: aYearAgo,
      expirationTime: tomorrow,
    );

    final badToken = ByteToken(
      payload: badPayload,
      signature: signature(badPayload),
    );

    test(
        'GIVEN identical ByteToken '
        'WHEN compared for equality '
        'THEN returns true', () {
      final tester = token;
      expect(
        tester == token,
        isTrue,
        reason: 'equality should be true',
      );
    });
    test(
        'GIVEN different ByteToken '
        'WHEN compared for equality '
        'THEN returns false', () {
      expect(
        token == badToken,
        isFalse,
        reason: 'equality should be false',
      );
    });

    test(
        'GIVEN List<int> from ByteToken toBuffer '
        'WHEN when ByteToken.fromBuffer() '
        'THEN then returns the same ByteToken', () {
      final bytes = token.toBuffer();
      expect(
        ByteToken.fromBuffer(bytes) == token,
        isTrue,
        reason: 'Payload from token should be identical',
      );
    });
    test(
        'GIVEN a ByteToken  '
        'WHEN when toJson() '
        'THEN then returns a Json', () {
      final json = token.toJson();
      expect(
        json,
        isA<Json>(),
        reason: 'should return a json',
      );
    });

    test(
        'GIVEN a ByteToken  '
        'WHEN when toJson() '
        'THEN output is predicatable', () {
      final json = token.toJson();

      expect(
        json['payload'].toString() == payload.toString(),
        isTrue,
        reason: '"payload" should match',
      );

      expect(
        json['signature'] as String == base64Encode(signature(payload)),
        isTrue,
        reason: '"signature" should match',
      );
    });

    test(
        'GIVEN a ByteToken  '
        'WHEN when toString() '
        'THEN then returns a String', () {
      expect(
        token.toString(),
        isA<String>(),
        reason: 'should return a json',
      );
    });

    test(
        'GIVEN ByteToken  '
        'WHEN when toBuffer() '
        'THEN then returns identical output', () {
      expect(
        token.toBuffer().equals(token.toBuffer()),
        isTrue,
        reason: 'should be identical',
      );
    });

    test(
        'GIVEN ByteToken from Payload and signature '
        'WHEN  ByteToken'
        'THEN then returns identical output', () {
      ByteToken(
        payload: payload,
        signature: signature(payload),
      );
      expect(
        token.toBuffer().equals(token.toBuffer()),
        isTrue,
        reason: 'should be identical',
      );
    });
  });
}
