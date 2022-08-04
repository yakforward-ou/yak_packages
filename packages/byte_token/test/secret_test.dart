import 'dart:typed_data';

import 'package:byte_token/byte_token.dart';
import 'package:test/test.dart';

import 'mocks.dart';

void main() {
  group('Secret', () {
    test(
        'GIVEN a Secret '
        'WHEN call() '
        'THEN returns Uint8List', () {
      expect(
        validSecret(),
        isA<Uint8List>(),
        reason: 'should output Uint8List',
      );
    });
    test(
        'GIVEN string with valid lenght '
        'WHEN Secret() '
        'THEN returns Secret', () {
      expect(
        validSecret,
        isA<Secret>(),
        reason: 'should output Secret',
      );
    });

    test(
        'GIVEN string with invalid lenght '
        'WHEN Secret() '
        'THEN throws', () {
      expect(
        () => Secret('hello'),
        throwsA(isA<Exception>()),
        reason: 'should throw',
      );
    });
  });
}
