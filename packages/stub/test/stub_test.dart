import 'package:test/test.dart';
// ignore_for_file: avoid_catching_errors

import 'foo.dart';

void main() {
  group('`Stub` test', () {
    final foo = FooStub<int>();
    const data = 1;
    const times = 42;

    test(
        'GIVEN `stub is not initialized` '
        'WHEN Foo.foo is called '
        'THEN throw `LateInitializationError`', () {
      foo.reset;
      var error;
      try {
        foo.foo();
      } on Error catch (e) {
        error = e;
      }

      expect(
        error != null,
        true,
        reason: '`Foo.foo` throw `LateInitializationError`',
      );
    });

    test(
        'GIVEN `stub is null` '
        'WHEN Foo.foo is called '
        'THEN throw `AssertionError`', () {
      foo.reset;
      foo.result = () => data;
      foo.reset;
      var error;
      try {
        foo.foo();
      } on AssertionError catch (e) {
        error = e;
      }

      expect(
        error != null,
        true,
        reason: '`Foo.foo` throw `AssertionError`',
      );
    });
    test(
        'GIVEN `stub != null` '
        'WHEN Foo.foo is called '
        'THEN returns `result`', () {
      foo.reset;
      foo.result = () => data;
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
      foo.result = () => data;
      for (var i = 1; i < times; ++i) {
        foo.foo();
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
      /// foo.reset;

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
        'WHEN Foo.bar is set twice '
        'THEN  only latest has effect', () {
      foo.reset;
      foo.result = () => data;
      foo.result = () => data * times;

      expect(
        foo.foo(),
        data * times,
        reason: '`Foo.foo()` should be the latest `result` provided',
      );
    });
  });
}