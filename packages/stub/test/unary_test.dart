import 'package:stub/stub.dart';
import 'package:test/test.dart';

void main() {
  group('`Stub` UNARY test', () {
    final unary = Stub.unary<String, int>();
    const data = 1;
    const times = 42;
    test(
        'GIVEN `stub is not set` '
        'WHEN unary.stub is called '
        'THEN throw `UnimplementedError`', () {
      expect(
        () => unary(data),
        throwsA(isA<UnimplementedError>()),
        reason: '`unary.stub` should throw `UnimplementedError`',
      );
    });

    test(
        'GIVEN `stub = () => data` '
        'WHEN unary.stub is called '
        'THEN returns `data`', () {
      unary
        ..reset()
        ..stub = (i) => '$i';

      expect(
        unary(data),
        '$data',
        reason: '`unary.stub` should match `"data"`',
      );
    });
    test(
        'GIVEN `stub != null` '
        'WHEN unary.stub is called n times '
        'THEN  `count` == `times`', () {
      unary.reset();

      for (var i = 0; i < times; ++i) {
        unary(i);
      }
      expect(
        unary.count,
        times,
        reason: '`unary.count` should match `times`',
      );
    });
    test(
        '...'
        'WHEN  unary.stub is not called '
        'THEN  `callCount` persists', () {
      /// unary.reset();

      expect(
        unary.count,
        times,
        reason: '`unary.count` should persist across tests',
      );
    });
    test(
        'GIVEN _ '
        'WHEN Foo.foo is set twice '
        'THEN  only latest has effect', () {
      unary
        ..reset()
        ..stub = (i) => '${i * 3}';
      unary.stub = (i) => '${i * times}';

      expect(
        unary(data),
        '${data * times}',
        reason: '`unary()` should be the latest `result` provided',
      );
    });
  });
}
