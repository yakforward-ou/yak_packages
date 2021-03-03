import 'package:test/test.dart';
// ignore_for_file: avoid_catching_errors

import 'foo.dart';

class FooWrap {
  void Function() fun;
  FooWrap(this.fun);
  void call() {
    try {
      fun();
    } on Error catch (e) {
      if (e is AssertionError) {
        print('ok');
      }
      rethrow;
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
      foo.result = () => throw AssertionError();

      fooWrap();
    });
  });
}
