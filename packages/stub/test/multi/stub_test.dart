import 'package:test/test.dart';
// ignore_for_file: avoid_catching_errors

import 'foo.dart';

void main() {
  group('`Stub` test', () {
    const data = 1;
    const times = 42;

    test(
        'GIVEN `stub is not set` '
        'WHEN Foo.foo is called '
        'THEN throw `UnimplementedError`', () {
      final _foo = FooMultiStub<int, String>();

      expect(
        _foo.foo,
        throwsA(isA<Exception>()),
        reason: '`Foo.foo` should throw `Exception`',
      );

      print('ok');
    });

    final foo = FooMultiStub<int, String>();
    foo['foo'].stub = () => data;
    foo['bar'].stub = () => 'hello';

    test(
        'GIVEN `stub != null` '
        'WHEN Foo.foo is called '
        'THEN returns `result`', () {
      foo['foo'].reset;
      foo['bar'].reset;
      expect(
        foo.foo(),
        data,
        reason: '`Foo.foo` should match `data`',
      );
    });

    test(
        'GIVEN `stub != null` '
        'WHEN Foo.foo is called  n `times` '
        'THEN  `callCount` == `times`', () {
      foo['foo'].reset;
      foo['bar'].reset;
      for (var i = 1; i <= times; ++i) {
        foo.foo();
      }
      expect(
        foo['foo'].callCount,
        times,
        reason: '`Foo.callCount` should match `times`',
      );
      expect(
        foo['bar'].callCount,
        0,
        reason: '`bar` stub should not be called',
      );
    });

    test(
        'GIVEN Foo.foo '
        'WHEN Foo.reset is not called '
        'THEN  `callCount` persists', () {
      /// foo.reset;

      expect(
        foo['foo'].callCount,
        times,
        reason: '`Foo.callCount` should match `times`',
      );
    });

    test(
        'GIVEN Foo.bar is not called '
        'WHEN Foo.foo is called '
        'THEN  Foo.bar `callCount` does not change', () {
      foo['foo'].reset;
      foo['bar'].reset;

      foo.foo();

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

    test(
        'GIVEN _ '
        'WHEN Foo.bar is set twice '
        'THEN  only latest has effect', () {
      foo['foo'].reset;
      foo['bar'].reset;
      foo['foo'].stub = () => data * times;

      expect(
        foo.foo(),
        data * times,
        reason: '`Foo.foo()` should be the latest `result` provided',
      );
    });

    test(
        'GIVEN _ '
        'WHEN Foo.bar is set twice '
        'THEN  only latest has effect', () {
      foo['foo'].reset;
      foo['bar'].reset;
      foo['bar'].stub = () => '${data * times}';

      expect(
        foo.bar(),
        '${data * times}',
        reason: '`Foo.bar()` should be the latest `result` provided',
      );
    });
  });
}
