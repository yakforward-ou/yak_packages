import 'dart:convert';

import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../mocks/all.dart';

void main() {
  final foo = Foo(0);
  final fooJson = jsonEncode(foo.toJson());
  final twoFooJson = jsonEncode([foo.toJson(), foo.toJson()]);

  group('`JsonDecodeToMap & JsonDecodeToList`', () {
    test(
        'GIVEN `JsonDecodeToMap` '
        'WHEN `valid json is parsed` '
        'THEN returns `Success`', () {
      final runner = JsonDecodeToMap();

      final result = runner(fooJson);
      expect(
        result,
        isA<Success<Map<String, Object?>>>(),
        reason: 'should be a `success`',
      );
    });

    test(
        'GIVEN `JsonDecodeToMap` '
        'WHEN  valid json is parsed` '
        'THEN returns `Success`', () {
      final runner = JsonDecodeToMap();

      final result = runner(fooJson);
      expect(
        result,
        isA<Success<Map<String, Object?>>>(),
        reason: 'should be a `success`',
      );
    });

    test(
        'GIVEN `JsonDecodeToMap` '
        'WHEN INVALID json is parsed` '
        'THEN returns `Failure`', () {
      final runner = JsonDecodeToMap();

      final result = runner('');
      expect(
        result,
        isA<Failure<Map<String, Object?>>>(),
        reason: 'should be a `Failure`',
      );
    });
    test(
        'GIVEN `JsonDecodeFromList` '
        'WHEN valid json is parsed` '
        'THEN returns `Success`', () {
      final runner = JsonDecodeToList();

      final result = runner(twoFooJson);
      expect(
        result,
        isA<Success<List<Map<String, Object?>>>>(),
        reason: 'should be a `success`',
      );
      expect(
        (result as Success<List<Map<String, Object?>>>).data,
        jsonDecode(twoFooJson),
        reason: 'should match `jsonEncode`',
      );
    });
    test(
        'GIVEN `JsonDecodeFromList` '
        'WHEN invalid json is parsed` '
        'THEN returns `Failure`', () {
      final runner = JsonDecodeToList();

      final result = runner('');
      expect(
        result,
        isA<Failure<List<Map<String, Object?>>>>(),
        reason: 'should be a `Failure`',
      );
    });
  });
}
