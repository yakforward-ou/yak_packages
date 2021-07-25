import 'dart:convert';

import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_result/yak_result.dart';

import '../../mocks/all.dart';

void main() {
  final foo = Foo(0);
  group('`JsonEncodeFromMap & JsonDecodeFromList`', () {
    test(
        'GIVEN `JsonEncodeFromMap` '
        'WHEN `valid json is parsed` '
        'THEN returns `Success`', () {
      final runner = JsonEncodeFromMap();

      final result = runner(foo.toJson());
      expect(
        result,
        isA<Success<String>>(),
        reason: 'should be a `success`',
      );
      expect(
        (result as Success<String>).data,
        jsonEncode(foo.toJson()),
        reason: 'should match `jsonEncode`',
      );
    });
    test(
        'GIVEN `JsonDecodeFromList` '
        'WHEN `valid json is parsed` '
        'THEN returns `Success`', () {
      final runner = JsonEncodeFromList();

      final result = runner([foo.toJson(), foo.toJson()]);
      expect(
        result,
        isA<Success<String>>(),
        reason: 'should be a `success`',
      );
      expect(
        (result as Success<String>).data,
        jsonEncode([foo.toJson(), foo.toJson()]),
        reason: 'should match `jsonEncode`',
      );
    });
  });
}
