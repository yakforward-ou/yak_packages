import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../../mocks/all.dart';

void main() {
  final foo = Foo(0);

  group('`ParseAsJsonX`', () {
    test(
        'GIVEN A `List<Map<String, Object?>`'
        'WHEN `parseAsJson<T>` '
        'THEN returns `Result<T>`', () {
      () => expect(
            foo.toJson().parseAsJson((json) => Foo.fromJson(json)),
            isA<Result<Foo>>(),
            reason: 'should return Result<Foo>',
          );
    });
  });
}
