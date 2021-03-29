import 'package:test/test.dart';
// ignore_for_file: avoid_catching_errors

import 'foo.dart';

class FooWrap {
  void Function() fun;
  FooWrap(this.fun);
  bool call() {
    try {
      fun();
      return false;
    } on Error catch (e) {
      if (e is AssertionError) {
        return true;
      }
      return false;
    }
  }
}

void main() {
  group('`Stub` in "nested delegate"', () {
    final foo = FooStub<void>()..stub = () => throw AssertionError();
    ;
    final fooWrap = FooWrap(foo.foo);
    test(
        'GIVEN an error throwing`stub` '
        'WHEN foo is called '
        'THEN error flow through the stubbed class', () {
      foo.reset;

      expect(
        fooWrap(),
        true,
        reason: '`AssertionError should "flow" until the function is run`',
      );
    });
  });
}
