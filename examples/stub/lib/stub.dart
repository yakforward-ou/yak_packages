import 'package:stub/stub.dart';
import 'package:test/test.dart';

void main() {
  group('how to use `Stub`', () {
    final tester = Stub.nullary<int>();

    setUp(tester.reset);

    test(
        'GIVEN tester function is not set '
        'WHEN tester.call() '
        'THEN throws UnimplementedError', () {
      expect(
        () => tester(),
        throwsUnimplementedError,
      );

      expect(
        tester.count == 1,
        isTrue,
      );
    });

    test(
        'GIVEN tester function is set '
        'WHEN tester.call() '
        'THEN returns function result', () {
      tester.stub = () => 42;

      expect(
        tester(),
        isA<int>(),
      );

      expect(
        tester.count == 1,
        isTrue,
      );
    });

    test(
        'GIVEN tester function throws Exception '
        'WHEN tester.call() '
        'THEN throws Exception', () {
      tester.stub = () {
        throw Exception();
      };

      expect(
        () => tester(),
        throwsException,
      );

      expect(
        tester.count == 1,
        isTrue,
      );
    });

    test(
        'GIVEN tester is reset each test '
        'WHEN tester.call() is called `n` times '
        'THEN tester.count is `n`', () {
      tester.stub = () => 42;
      const n = 10;
      for (var i = 1; i <= n; i++) {
        tester();
      }
      expect(
        tester.count == n,
        isTrue,
      );
    });
  });
}
