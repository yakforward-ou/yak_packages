import 'dart:convert';

import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../mocks/all.dart';

void main() {
  final foo = Foo(0);
  final bar = Bar(0);
  final fooJson = jsonEncode(foo.toJson());
  final barJson = jsonEncode(bar.toJson());

  final runner = JsonParser<Foo>((json) => Foo.fromJson(json));
  group('`JsonParser`', () {
    test('WHEN `valid json is parsed` THEN returns `Success`', () {
      final result = runner(jsonDecode(fooJson));
      expect(
        result,
        isA<Success<Foo>>(),
        reason: 'should be a `success`',
      );
    });

    test('WHEN `INVALID json is parsed` THEN returns `Failure`', () {
      final result = runner(jsonDecode(barJson));
      expect(
        result,
        isA<Failure<Foo>>(),
        reason: 'should be a `failure`',
      );
    });
  });
}
