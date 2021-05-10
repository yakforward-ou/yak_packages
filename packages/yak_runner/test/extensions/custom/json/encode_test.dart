import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../../mocks/all.dart';

void main() {
  final foo = Foo(0);

  group('`MapSafelyEncodeX & ListSafelyEncodeX`', () {
    test(
        'GIVEN A `Map<String, Object?>`'
        'WHEN `encode` '
        'THEN returns `Result<String>`', () {
      () => expect(
            foo.toJson().encode(),
            isA<Result<String>>(),
            reason: 'should return Result<String>',
          );
    });
    test(
        'GIVEN A `List<Map<String, Object?>>`'
        'WHEN `encode` '
        'THEN returns `Result<String>`', () {
      () => expect(
            [foo.toJson(), foo.toJson()].encode(),
            isA<Result<String>>(),
            reason: 'should return Result<String>',
          );
    });
  });
}
