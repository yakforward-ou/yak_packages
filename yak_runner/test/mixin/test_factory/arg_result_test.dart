import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/src/mixin/test_factory/arg_result.dart';
import 'package:yak_runner/yak_runner.dart';

mixin ArgTestFactoryMixin<S> {
  ArgTestDelegate<S> buildTest(ArgTestFactoryDelegate testFactory) =>
      testFactory<S>();
}

class Test<T, S> implements ArgResultTestDelegate<T, S> {
  Type get resultType => T;
  Type get argType => S;

  @override
  void call(FutureOr<T> result, FutureOr<S> arg) {}
}

class ArgREsultTestFactory implements ArgResultTestFactoryDelegate {
  @override
  ArgResultTestDelegate<T, S> call<T, S>() => Test<T, S>();
}

class Foo<T, S> with ArgResultTestFactoryMixin<T, S> {}

void main() {
  group('ArgTestFactoryMixin', () {
    final foo = Foo<int, String>();

    test(
        'WHEN `Foo<int,String>` with `ArgTestFactoryMixin` THEN `buildTest` returns ArgTestDelegate of argType `String`',
        () {
      final test = foo.buildTest(ArgREsultTestFactory()) as Test;
      expect(test.argType, String,
          reason:
              '[arg]: `ArgResultTestDelegate` types should match `ArgTestFactoryMixin`');
      expect(test.resultType, int,
          reason:
              '[result]: `ArgResultTestDelegate` types should match `ArgTestFactoryMixin`');
    });
  });
}
