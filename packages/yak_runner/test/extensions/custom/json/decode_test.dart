import 'dart:convert';

import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../../mocks/all.dart';

void main() {
  final foo = Foo(0);

  group('`MapSafelyDecodeX & ListSafelyDecodeX`', () {
    test(
        'GIVEN A `String`'
        'WHEN `JsonDecodeToMap` '
        'THEN returns ` Result<Map<String, Object?>>`', () {
      () => expect(
            jsonEncode(foo.toJson()).jsonDecodeAsMap(),
            isA<Result<Map<String, Object?>>>(),
            reason: 'should return Result<Map<String, Object?>>',
          );
    });
    test(
        'GIVEN A `String`'
        'WHEN `JsonDecodeToList` '
        'THEN returns ` Result<List<Map<String, Object?>>>`', () {
      () => expect(
            jsonEncode([foo.toJson(), foo.toJson()]).jsonDecodeAsList(),
            isA<Result<Result<List<Map<String, Object?>>>>>(),
            reason: 'should return  Result<List<Map<String, Object?>>>',
          );
    });
  });
}
