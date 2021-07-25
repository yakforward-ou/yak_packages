import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_result/yak_result.dart';

import '../../../mocks/all.dart';

void main() {
  final foo = Foo(0);
  final json = foo.toJson();

  group('`ParseAsJsonX`', () {
    test(
        'GIVEN a Map<String,Object?>'
        'WHEN `parseAsJson<T>` '
        'THEN returns `Result<T>`', () {
      expect(
        json.parseAsJson((json) => Foo.fromJson(json)),
        isA<Result<Foo>>(),
        reason: 'should return Result<Foo>',
      );
    });
    test(
        'GIVEN a valid json'
        'WHEN `parseAsJson<T>` '
        'THEN returns `Success<T>`', () {
      expect(
        json.parseAsJson((json) => Foo.fromJson(json)),
        isA<Success<Foo>>(),
        reason: 'should return `Success`',
      );
      expect(
        (json.parseAsJson((json) => Foo.fromJson(json)) as Success<Foo>)
            .data
            .data,
        foo.data,
        reason: 'should return `Foo`',
      );
    });
    test(
        'GIVEN an invalid json'
        'WHEN `parseAsJson<T>` '
        'THEN returns `Failure<T>`', () {
      expect(
        json.parseAsJson((json) => throw Exception()),
        isA<Failure<Foo>>(),
        reason: 'should return `failure`',
      );
    });
  });
}
