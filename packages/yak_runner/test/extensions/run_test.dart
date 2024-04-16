import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ResultNullaryX', () {
    final tester = Stub.nullary<int>();
    tester.stub = () => 42;

    group('run', () {
      setUp(tester.reset);
      test(
          'GIVEN a Nullary function '
          'WHEN nullary.run '
          'THEN returns a ResultNullary', () {
        expect(
          tester.call.run,
          isA<ResultNullary<int>>(),
          reason: 'return type should be predictable',
        );
      });
    });
    group('runVoid', () {
      setUp(tester.reset);
      test(
          'GIVEN a Nullary function '
          'WHEN nullary.runVoid '
          'THEN returns a VoidResultNullary', () {
        expect(
          tester.call.runVoid,
          isA<VoidResultNullary>(),
          reason: 'return type should be predictable',
        );
      });
    });
  });

  group('ResultNullaryFutureOrX', () {
    final tester = Stub.nullary<Future<int>>();
    tester.stub = () => Future.sync(() => 42);

    group('run', () {
      setUp(tester.reset);
      test(
          'GIVEN a NullaryAsync function '
          'WHEN nullary.runAsync '
          'THEN returns a ResultNullaryAsync', () {
        expect(
          tester.call.runAsync,
          isA<ResultNullaryAsync<int>>(),
          reason: 'return type should be predictable',
        );
      });
    });
    group('runVoid', () {
      setUp(tester.reset);
      test(
          'GIVEN a NullaryAsync function '
          'WHEN nullary.run '
          'THEN returns a VoidResultNullaryAsync', () {
        expect(
          tester.call.runVoidAsync,
          isA<VoidResultNullaryAsync>(),
          reason: 'return type should be predictable',
        );
      });
    });
  });

  group('ResultUnaryX', () {
    final tester = Stub.unary<int, String>();
    tester.stub = (string) => string.length;

    group('run', () {
      setUp(tester.reset);
      test(
          'GIVEN a Unary function '
          'WHEN nullary.run '
          'THEN returns a ResultUnary', () {
        expect(
          tester.call.run,
          isA<ResultUnary<int, String>>(),
          reason: 'return type should be predictable',
        );
      });
    });
    group('runVoid', () {
      setUp(tester.reset);
      test(
          'GIVEN a Unary function '
          'WHEN nullary.runVoid '
          'THEN returns a ResultNullary', () {
        expect(
          tester.call.runVoid,
          isA<VoidResultUnary<String>>(),
          reason: 'return type should be predictable',
        );
      });
    });
  });

  group('ResultNullaryFutureOrX', () {
    final tester = Stub.unary<Future<int>, String>();
    tester.stub = (string) => Future.sync(() => string.length);

    group('run', () {
      setUp(tester.reset);
      test(
          'GIVEN a UnaryAsync function '
          'WHEN nullary.run '
          'THEN returns a ResultNullary', () {
        expect(
          tester.call.runAsync,
          isA<ResultUnaryAsync<int, String>>(),
          reason: 'return type should be predictable',
        );
      });
    });
    group('runVoid', () {
      setUp(tester.reset);
      test(
          'GIVEN a Nullary function '
          'WHEN nullary.run '
          'THEN returns a ResultNullary', () {
        expect(
          tester.call.runVoidAsync,
          isA<VoidResultUnaryAsync<String>>(),
          reason: 'return type should be predictable',
        );
      });
    });
  });
}
