import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

mixin ArgTestFactoryMixin<S> {
  ArgTestDelegate<S> buildTest(ArgTestFactoryDelegate testFactory) =>
      testFactory<S>();
}

class Test<S> implements ArgTestDelegate<S> {
  @override
  void call(FutureOr<S> arg) {}

  Type get ofType => S;
}

class ArgTestFactory implements ArgTestFactoryDelegate {
  @override
  ArgTestDelegate<S> call<S>() => Test<S>();
}

class Foo<T> with ArgTestFactoryMixin<T> {}

void main() {
  group('ArgTestFactoryMixin', () {
    final foo = Foo<String>();

    test(
        'WHEN `Foo<String>` with `ArgTestFactoryMixin` THEN `buildTest` returns ArgTestDelegate of Type `String`',
        () {
      final test = foo.buildTest(ArgTestFactory()) as Test;
      expect(test.ofType, String,
          reason:
              '`ArgTestDelegate` should be of the same type of `ArgTestFactoryMixin`');
    });
  });
}
