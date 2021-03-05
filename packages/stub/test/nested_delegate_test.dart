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
    final foo = FooStub<void>();
    final fooWrap = FooWrap(foo.foo);
    test(
        'GIVEN `stub != null` '
        'WHEN Bar.bar is called '
        'THEN returns `result` regardless the arguments', () {
      foo.reset;
      foo.stub = () => throw AssertionError();

      expect(
        fooWrap(),
        true,
        reason: '`AssertionError should "flow" until the function is run`',
      );
    });
  });
}
