import 'package:test/test.dart';
// ignore_for_file: avoid_catching_errors

import 'foo.dart';

class FooWrap {
  void Function(void _) fun;
  FooWrap(this.fun);
  bool call(_) {
    try {
      fun(_);
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
    final foo = UnaryFooStub<void, void>()
      ..stub = (_) => throw AssertionError();
    ;
    final fooWrap = FooWrap(foo.foo);
    test(
        'GIVEN an error throwing`stub` '
        'WHEN foo is called '
        'THEN error flow through the stubbed class', () {
      foo.reset;

      expect(
        fooWrap(Null),
        true,
        reason: '`AssertionError should "flow" until the function is run`',
      );
    });
  });
}
