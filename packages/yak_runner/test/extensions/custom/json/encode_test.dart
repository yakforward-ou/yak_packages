import 'dart:convert';

import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../../mocks/all.dart';

void main() {
  final foo = Foo(0);
  final json = foo.toJson();

  group('`MapSafelyEncodeX & ListSafelyEncodeX`', () {
    test(
        'GIVEN A `Map<String, Object?>`'
        'WHEN `encode` '
        'THEN returns `Result<String>`', () {
      expect(
        json.encode(),
        isA<Result<String>>(),
        reason: 'should return Result<String>',
      );
    });

    test(
        'GIVEN A valid json`'
        'WHEN `encode` '
        'THEN returns `Success<String>`', () {
      expect(
        json.encode(),
        isA<Success<String>>(),
        reason: 'should return Success<String>',
      );

      expect(
        (json.encode() as Success<String>).data,
        jsonEncode(json),
        reason: 'should match jsonEncode',
      );
    });
  });
  group('`MapSafelyEncodeX', () {
    final jsonList = [foo.toJson(), foo.toJson()];
    test(
        'GIVEN A valid json`'
        'WHEN `encode` '
        'THEN returns `Result<String>`', () {
      expect(
        jsonList.encode(),
        isA<Result<String>>(),
        reason: 'should return Result<String>',
      );
      expect(
        (jsonList.encode() as Success<String>).data,
        jsonEncode(jsonList),
        reason: 'should match jsonEncode',
      );
    });
  });
}
