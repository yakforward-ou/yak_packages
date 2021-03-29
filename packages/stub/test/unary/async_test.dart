import 'dart:async';
import 'package:test/test.dart';
import 'foo.dart';

void main() {
  group('`UnaryStub` async test', () {
    const data = 1;
    final fooStub = UnaryFooStub<Future<String>, FutureOr<int>>()
      ..stub = (i) async => '${await i}';

    test(
        'GIVEN `stub != null` '
        'WHEN Foo.foo is called '
        'THEN returns `result`', () async {
      fooStub.reset;
      expect(
        await fooStub.foo(data),
        '$data',
        reason: '`Foo.foo` should match `data`',
      );
    });
  });
}
