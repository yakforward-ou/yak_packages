import 'package:test/test.dart';

import 'foo.dart';

void main() {
  group('`Stub` async test', () {
    const data = 1;
    final fooStub = FooStub<Future<int>>()..stub = () async => data;

    test(
        'GIVEN `stub != null` '
        'WHEN Foo.foo is called '
        'THEN returns `result`', () async {
      fooStub.reset;

      expect(
        await fooStub.foo(),
        data,
        reason: '`Foo.foo` should match `data`',
      );
    });
  });
}
