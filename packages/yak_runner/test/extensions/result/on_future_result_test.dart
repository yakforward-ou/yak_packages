import 'dart:async';
import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() async {
  const data = 1;
  const res = '$data';
  final mockExceptionHandler = MockHandleExceptionDelegate()
    ..stub.stub = (_) {};
  final firstDelegate = nullaryStub<Future<int>>();
  final secondDelegate = unaryStub<Future<String>, FutureOr<int>>();
  final firstRunner = RunnerAsync<int>(
    firstDelegate.wrap,
    exceptionHandler: mockExceptionHandler,
  );

  final secondRunner = UnaryRunnerAsync<String, int>(
    secondDelegate.wrap,
    exceptionHandler: mockExceptionHandler,
  );

  group('`onFutureResult` EXTENSION', () {
    test('WHEN `Delegate<Future<S>>` fails THEN  `onResult() return Failure<T>',
        () async {
      mockExceptionHandler.stub.reset;
      firstDelegate.reset;
      secondDelegate.reset;

      firstDelegate.stub = () => throw Exception();
      secondDelegate.stub = (i) async => res;

      final result = await firstRunner().onFutureResult<String>(secondRunner);

      expect(
        result,
        isNotNull,
        reason: '`result` must not be null',
      );
      expect(
        result,
        isNot(Success),
        reason: '`result` should not be `Success`',
      );
      expect(
        result is Failure<int>,
        false,
        reason: '`result`should not be `Failure<S>`',
      );
      expect(
        result,
        isA<Failure<String>>(),
        reason: '`result` should be `Failure<T>`',
      );
      expect(
        firstDelegate.count,
        1,
        reason: '`firstDelegate` should be called once',
      );
      expect(
        secondDelegate.count,
        0,
        reason: '`secondDelegate` should NOT be called',
      );
      expect(
        mockExceptionHandler.stub.count,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });

    test(
        'WHEN `ArgDelegate<Future<T>,FutureOr<S>>` fail '
        'THEN  `onResult() return Failure<T>', () async {
      mockExceptionHandler.stub.reset;
      firstDelegate.reset;
      secondDelegate.reset;

      firstDelegate.stub = () async => data;
      secondDelegate.stub = (i) => throw Exception();

      final result = await firstRunner().onFutureResult<String>(secondRunner);

      expect(
        result,
        isNotNull,
        reason: '`result` must not be null',
      );
      expect(
        result,
        isNot(Success),
        reason: '`result` should not be `Success`',
      );
      expect(
        result is Failure<int>,
        false,
        reason: '`result`should not be `Failure<S>`',
      );
      expect(
        result,
        isA<Failure<String>>(),
        reason: '`result` should be `Failure<T>`',
      );
      expect(
        firstDelegate.count,
        1,
        reason: '`firstDelegate` should be called once',
      );
      expect(
        secondDelegate.count,
        1,
        reason: '`secondDelegate` should NOT be called',
      );
      expect(
        mockExceptionHandler.stub.count,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });

    test(
        'WHEN `ArgDelegate<Future<T>,FutureOr<S>>` does not fail '
        'THEN  `onResult() return Success<T>', () async {
      mockExceptionHandler.stub.reset;
      firstDelegate.reset;
      secondDelegate.reset;

      firstDelegate.stub = () async => data;
      secondDelegate.stub = (i) async => res;

      final result = await firstRunner().onFutureResult<String>(secondRunner);

      expect(
        result,
        isNotNull,
        reason: '`result` must not be null',
      );
      expect(
        result,
        isA<Success>(),
        reason: '`result` should be `Success`',
      );

      expect(
        result,
        isNot(Failure),
        reason: '`result` should not be `Failure`',
      );
      expect(
        firstDelegate.count,
        1,
        reason: '`firstDelegate` should be called once',
      );
      expect(
        secondDelegate.count,
        1,
        reason: '`secondDelegate` should NOT be called',
      );
      expect(
        mockExceptionHandler.stub.count,
        0,
        reason: '`exceptionHandler` shoul NOT be called',
      );
    });
  });
}
