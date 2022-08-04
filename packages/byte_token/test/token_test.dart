import 'dart:convert';

import 'package:byte_token/byte_token.dart';
import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

import 'mocks.dart';

void main() {
  group('ByteToken', () {
    test(
        'GIVEN identical ByteToken '
        'WHEN compared for equality '
        'THEN returns true', () {
      final tester = validToken;
      expect(
        tester == validToken,
        isTrue,
        reason: 'equality should be true',
      );
    });
    test(
        'GIVEN different ByteToken '
        'WHEN compared for equality '
        'THEN returns false', () {
      expect(
        validToken == badToken,
        isFalse,
        reason: 'equality should be false',
      );
    });

    test(
        'GIVEN List<int> from ByteToken toBuffer '
        'WHEN when ByteToken.fromBuffer() '
        'THEN then returns the same ByteToken', () {
      final bytes = validToken.toBuffer();
      expect(
        ByteToken.fromBuffer(bytes) == validToken,
        isTrue,
        reason: 'Payload from token should be identical',
      );
    });
    test(
        'GIVEN a ByteToken  '
        'WHEN when toJson() '
        'THEN then returns a Json', () {
      final json = validToken.toJson();
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
      final json = validToken.toJson();

      expect(
        json['payload'].toString() == validPayload.toString(),
        isTrue,
        reason: '"payload" should match',
      );

      final signature = base64Encode(validSignature(validPayload));
      expect(
        json['signature'] as String == signature,
        isTrue,
        reason: '"signature" should match',
      );
    });

    test(
        'GIVEN a ByteToken  '
        'WHEN when toString() '
        'THEN then returns a String', () {
      expect(
        validToken.toString(),
        isA<String>(),
        reason: 'should return a json',
      );
    });

    test(
        'GIVEN ByteToken  '
        'WHEN when toBuffer() '
        'THEN then returns identical output', () {
      expect(
        validToken.toBuffer().equals(validToken.toBuffer()),
        isTrue,
        reason: 'should be identical',
      );
    });
  });
}
