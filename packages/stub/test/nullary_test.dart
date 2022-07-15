import 'package:stub/stub.dart';
import 'package:test/test.dart';

void main() {
  group('`Stub` NULLARY test', () {
    final nullary = Stub.nullary<int>();
    const data = 1;
    const times = 42;
    test(
        'GIVEN `stub is not set` '
        'WHEN nullary.stub is called '
        'THEN throw `UnimplementedError`', () {
      expect(
        nullary.call,
        throwsA(isA<UnimplementedError>()),
        reason: '`nullary.stub` should throw `UnimplementedError`',
      );
    });

    test(
        'GIVEN `stub = () => data` '
        'WHEN nullary.stub is called '
        'THEN returns `data`', () {
      nullary
        ..reset()
        ..stub = () => data;

      expect(
        nullary(),
        data,
        reason: '`nullary.stub` should match `data`',
      );
    });
    test(
        'GIVEN `stub != null` '
        'WHEN nullary.stub is called n times '
        'THEN  `count` == `times`', () {
      nullary.reset();

      for (var i = 0; i < times; ++i) {
        nullary();
      }
      expect(
        nullary.count,
        times,
        reason: '`nullary.stub` should match `times`',
      );
    });
    test(
        '...'
        'WHEN  nullary.stub is not called '
        'THEN  `callCount` persists', () {
      /// nullary.reset();

      expect(
        nullary.count,
        times,
        reason: '`nullary.stub` should persist across tests',
      );
    });
    test(
        'GIVEN _ '
        'WHEN Foo.foo is set twice '
        'THEN  only latest has effect', () {
      nullary
        ..reset()
        ..stub = () => data * 3;

      nullary.stub = () => data * times;

      expect(
        nullary(),
        data * times,
        reason: '`nullary.stub()` should be the latest `result` provided',
      );
    });
  });
}
