import 'dart:async';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() async {
  const data = 1;
  const res = '$data';
  final exceptionHandler = HandleExceptionDelegateStub();
  final firstDelegate = MockDelegate<Future<int>>();
  final secondDelegate = MockUnaryDelegate<Future<String>, FutureOr<int>>();
  final firstRunner = YakRunnerAsync<int>(
    firstDelegate,
    exceptionHandler: exceptionHandler,
  );

  final secondRunner = YakRunnerArgAsync<String, int>(
    secondDelegate,
    exceptionHandler: exceptionHandler,
  );

  group('`onFutureResult` EXTENSION', () {
    test('WHEN `Delegate<Future<S>>` fails THEN  `onResult() return Failure<T>',
        () async {
      exceptionHandler.reset;
      firstDelegate.reset;
      secondDelegate.reset;

      firstDelegate.stub = () => throw Exception();
      secondDelegate.stub = () async => res;
      exceptionHandler.stub = () {};

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
        firstDelegate.callCount,
        1,
        reason: '`firstDelegate` should be called once',
      );
      expect(
        secondDelegate.callCount,
        0,
        reason: '`secondDelegate` should NOT be called',
      );
      expect(
        exceptionHandler.callCount,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });

    test(
        'WHEN `ArgDelegate<Future<T>,FutureOr<S>>` fail '
        'THEN  `onResult() return Failure<T>', () async {
      exceptionHandler.reset;
      firstDelegate.reset;
      secondDelegate.reset;

      firstDelegate.stub = () async => data;
      secondDelegate.stub = () => throw Exception();
      exceptionHandler.stub = () {};

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
        firstDelegate.callCount,
        1,
        reason: '`firstDelegate` should be called once',
      );
      expect(
        secondDelegate.callCount,
        1,
        reason: '`secondDelegate` should NOT be called',
      );
      expect(
        exceptionHandler.callCount,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });

    test(
        'WHEN `ArgDelegate<Future<T>,FutureOr<S>>` does not fail '
        'THEN  `onResult() return Success<T>', () async {
      exceptionHandler.reset;
      firstDelegate.reset;
      secondDelegate.reset;

      firstDelegate.stub = () async => data;
      secondDelegate.stub = () async => res;
      exceptionHandler.stub = () {};

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
        firstDelegate.callCount,
        1,
        reason: '`firstDelegate` should be called once',
      );
      expect(
        secondDelegate.callCount,
        1,
        reason: '`secondDelegate` should NOT be called',
      );
      expect(
        exceptionHandler.callCount,
        0,
        reason: '`exceptionHandler` shoul NOT be called',
      );
    });
  });
}
