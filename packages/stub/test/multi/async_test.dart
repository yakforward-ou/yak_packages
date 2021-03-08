import 'package:test/test.dart';

import 'foo.dart';

void main() {
  group('`Stub` async test', () {
    const data = 1;
    final foo = FooMultiStub<Future<int>, Future<String>>();
    foo['foo'].stub = () async => data;
    foo['bar'].stub = () async => 'hello';

    test(
        'GIVEN `stub != null` '
        'WHEN Foo.foo is called '
        'THEN returns `result`', () async {
      foo['foo'].reset;
      foo['bar'].reset;
      expect(
        await foo.foo(),
        data,
        reason: '`Foo.foo` should match `data`',
      );

      expect(
        foo['foo'].callCount,
        1,
        reason: '`foo` stub should be called once',
      );
      expect(
        foo['bar'].callCount,
        0,
        reason: '`bar` stub should not be called once',
      );
    });
  });
}
