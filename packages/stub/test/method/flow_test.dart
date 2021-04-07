import 'package:stub/stub.dart';
import 'package:test/test.dart';

// ignore_for_file: avoid_catching_errors

class Wrap<T> {
  T Function() fun;
  Wrap(this.fun);
  T call() => fun();
}

void main() {
  group('`Stub DELEGATE` in "nested error flow"', () {
    final method = nullaryStub<void>();
    final wrap = Wrap<void>(method.stub);

    // test(
    //     'GIVEN an unimplemented stub` '
    //     'WHEN method is called '
    //     'THEN error flows through the "nested" class', () {
    //   expect(
    //     wrap.call,
    //     throwsUnimplementedError,
    //     reason: '`should return unimplemented`',
    //   );
    //   expect(
    //     method.count,
    //     1,
    //     reason: '`method should be called once`',
    //   );
    // });

    test(
        'GIVEN an implemented stub` '
        'WHEN method is called '
        'THEN returns normally', () {
      method.reset;
      method.stub = () {};
      final _ = wrap();
      expect(
        method.count,
        1,
        reason: '`method should be called once`',
      );
    });
  });
}
