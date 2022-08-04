import 'dart:typed_data';

import 'package:byte_token/byte_token.dart';
import 'package:test/test.dart';

void main() {
  group('Secret', () {
    final secret = Secret(
      'eyJ1c2VySWQiOiJhYmNkMTIzIiwiZXhwaXJ5IjoxNjQ2NjM1NjExMzAx',
    );
    test(
        'GIVEN a Secret '
        'WHEN call() '
        'THEN returns Uint8List', () {
      expect(
        secret(),
        isA<Uint8List>(),
        reason: 'should output Uint8List',
      );
    });
    test(
        'GIVEN string with valid lenght '
        'WHEN Secret() '
        'THEN returns Secret', () {
      expect(
        secret,
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
