import 'package:test/test.dart';
// ignore_for_file: avoid_catching_errors

import 'foo.dart';

void main() {
  group('`Stub` test', () {
    test(
        'GIVEN `stub is not set` '
        'WHEN Foo.foo is called '
        'THEN throw `Exception`', () {
      final foo = UnaryFooStub<String, int>();
      late final exception;
      try {
        foo.foo(0);
      } on Exception catch (e) {
        exception = e;
      }
      expect(
        exception,
        isA<Exception>(),
        reason: '`Foo.foo` should throw `Exception`',
      );
    });

    const data = 1;
    final foo = UnaryFooStub<String, int>()..stub = (i) => '$i';
    const times = 42;
    test(
        'GIVEN `stub != null` '
        'WHEN Foo.foo is called '
        'THEN returns `result`', () {
      foo.reset;

      expect(
        foo.foo(data),
        '$data',
        reason: '`Foo.foo` should match `data`',
      );
    });

    test(
        'GIVEN `stub != null` '
        'WHEN Foo.foo is called  n `times` '
        'THEN  `callCount` == `times`', () {
      for (var i = 1; i < times; ++i) {
        foo.foo(i);
      }
      expect(
        foo.callCount,
        times,
        reason: '`Foo.callCount` should match `times`',
      );
    });

    test(
        'GIVEN Foo.foo '
        'WHEN Foo.reset is not called '
        'THEN  `callCount` persists', () {
      expect(
        foo.callCount,
        times,
        reason: '`Foo.callCount` should persist across tests',
      );
    });

    test(
        'GIVEN Foo.bar is not stubbed '
        'WHEN Foo.bar is called '
        'THEN  `callCount` does not change', () {
      foo.reset;
      try {
        foo.bar();
      } on Error catch (_) {}
      expect(
        foo.callCount,
        0,
        reason: '`Foo.callCount` should be `0`',
      );
    });

    test(
        'GIVEN _ '
        'WHEN Foo.foo is set twice '
        'THEN  only latest has effect', () {
      foo.reset;
      foo.stub = (i) => '${i * times}';

      expect(
        foo.foo(data),
        '${data * times}',
        reason: '`Foo.foo()` should be the latest `result` provided',
      );
    });
  });
}
