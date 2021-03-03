import 'package:test/test.dart';

import 'foo.dart';

void main() {
  group('`Stub` async test', () {
    final fooStub = FooStub<Future<int>>();
    const data = 1;
    test(
        'GIVEN `stub != null` '
        'WHEN Foo.foo is called '
        'THEN returns `result`', () async {
      fooStub.reset;
      fooStub.result = () async => data;
      expect(
        await fooStub.foo(),
        data,
        reason: '`Foo.foo` should match `data`',
      );
    });
  });
}
