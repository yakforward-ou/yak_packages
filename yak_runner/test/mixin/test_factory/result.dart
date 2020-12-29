import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

mixin ResultTestFactoryMixin<S> {
  ResultTestDelegate<S> buildTest(ResultTestFactoryDelegate testFactory) =>
      testFactory<S>();
}

class Test<S> implements ResultTestDelegate<S> {
  @override
  void call(FutureOr<S> result) {}

  Type get ofType => S;
}

class ResultTestFactory implements ResultTestFactoryDelegate {
  @override
  ResultTestDelegate<S> call<S>() => Test<S>();
}

class Foo<T> with ResultTestFactoryMixin<T> {}

void main() {
  group('ResultTestFactoryMixin', () {
    final foo = Foo<String>();

    test(
        'WHEN `Foo<String>` with `ResultTestFactoryMixin` THEN `buildTest` returns ResultTestDelegate of Type `String`',
        () {
      final test = foo.buildTest(ResultTestFactory()) as Test;
      expect(test.ofType, String,
          reason:
              '`ResultTestDelegate` should be of the same type of `ResultTestFactoryMixin`');
    });
  });
}
