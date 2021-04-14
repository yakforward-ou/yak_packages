import 'package:stub/stub.dart';
import 'package:test/test.dart';

void main() {
  group('`Stub` UNARY test', () {
    final method = unaryStub<String, int>();
    const data = 1;
    const times = 42;
    test(
        'GIVEN `stub is not set` '
        'WHEN method.stub is called '
        'THEN throw `UnimplementedError`', () {
      expect(
        () => method.stub(data),
        throwsA(isA<UnimplementedError>()),
        reason: '`method.stub` should throw `UnimplementedError`',
      );
    });

    test(
        'GIVEN `stub = () => data` '
        'WHEN method.stub is called '
        'THEN returns `data`', () {
      method.reset;
      method.stub = (i) => '$i';

      expect(
        method.stub(data),
        '$data',
        reason: '`method.stub` should match `"data"`',
      );
    });
    test(
        'GIVEN `stub != null` '
        'WHEN method.stub is called n times '
        'THEN  `count` == `times`', () {
      method.reset;

      for (var i = 0; i < times; ++i) {
        method.stub(i);
      }
      expect(
        method.count,
        times,
        reason: '`method.stub` should match `times`',
      );
    });
    test(
        '...'
        'WHEN  method.stub is not called '
        'THEN  `callCount` persists', () {
      /// method.stub;

      expect(
        method.count,
        times,
        reason: '`method.stub` should persist across tests',
      );
    });
    test(
        'GIVEN _ '
        'WHEN Foo.foo is set twice '
        'THEN  only latest has effect', () {
      method.reset;
      method.stub = (i) => '${i * 3}';
      method.stub = (i) => '${i * times}';

      expect(
        method.stub(data),
        '${data * times}',
        reason: '`method.stub()` should be the latest `result` provided',
      );
    });
  });
}
