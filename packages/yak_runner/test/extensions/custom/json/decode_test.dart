import 'dart:convert';

import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_result/yak_result.dart';

import '../../../mocks/all.dart';

void main() {
  final foo = Foo(0);
  final fooJson = jsonEncode(foo.toJson());
  final fooListJson = jsonEncode([foo.toJson(), foo.toJson()]);

  group('`MapSafelyDecodeX ', () {
    test(
        'GIVEN A `String`'
        'WHEN `JsonDecodeToMap` '
        'THEN returns ` Result<Map<String, Object?>>`', () {
      expect(
        fooJson.jsonDecodeAsMap(),
        isA<Result<Map<String, Object?>>>(),
        reason: 'should return Result<Map<String, Object?>>',
      );
    });
    test(
        'GIVEN A valid json`'
        'WHEN `JsonDecodeToMap` '
        'THEN returns ` Result<Map<String, Object?>>`', () {
      expect(
        fooJson.jsonDecodeAsMap(),
        isA<Success<Map<String, Object?>>>(),
        reason: 'should return Success<Map<String, Object?>>',
      );

      expect(
        (fooJson.jsonDecodeAsMap() as Success<Map<String, Object?>>).data,
        foo.toJson(),
        reason: 'should return Result<Map<String, Object?>>',
      );
    });
  });
  group('`MapSafelyDecodeX`', () {
    test(
        'GIVEN A `String`'
        'WHEN `JsonDecodeToList` '
        'THEN returns ` Result<List<Map<String, Object?>>>`', () {
      expect(
        fooListJson.jsonDecodeAsList(),
        isA<Result<List<Map<String, Object?>>>>(),
        reason: 'should return  Result<List<Map<String, Object?>>>',
      );
      expect(
        (fooListJson.jsonDecodeAsList() as Success<List<Map<String, Object?>>>)
            .data,
        [foo.toJson(), foo.toJson()],
        reason: 'should return Result<Map<String, Object?>>',
      );
    });
    test(
        'GIVEN A valid json`'
        'WHEN `JsonDecodeToList` '
        'THEN returns ` Success<List<Map<String, Object?>>>`', () {
      expect(
        fooJson.jsonDecodeAsMap(),
        isA<Success<Map<String, Object?>>>(),
        reason: 'should return Success<Map<String, Object?>>',
      );

      expect(
        (fooJson.jsonDecodeAsMap() as Success<Map<String, Object?>>).data,
        foo.toJson(),
        reason: 'should return Result<Map<String, Object?>>',
      );
    });
  });
}
