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
  group('`MultiStub` in "nested delegate"', () {
    const data = 1;
    final foo = FooMultiStub<int, String>();
    foo['foo'].stub = () => data;
    foo['bar'].stub = () => 'hello';
    final fooWrap = FooWrap(foo.foo);
    test(
        'GIVEN an error throwing`stub` '
        'WHEN foo is called '
        'THEN error flow through the stubbed class', () {
      foo['foo'].reset;
      foo['bar'].reset;

      expect(
        fooWrap(),
        true,
        reason: '`AssertionError should "flow" until the function is run`',
      );
      expect(
        foo['foo'].callCount,
        1,
        reason: '`foo` stub should be called once',
      );
      expect(
        foo['bar'].callCount,
        0,
        reason: '`bar` stub should not be called',
      );
    });
  });
}
