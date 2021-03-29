import 'dart:async';

import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  const data = 1;
  const res = '$data';
  final exceptionHandler = HandleExceptionDelegateStub();
  group('`onResultAsync` MIXIN', () {
    final firstDelegate = MockDelegate<int>();
    final secondDelegate = MockUnaryDelegate<Future<String>, FutureOr<int>>();

    final firstRunner = Runner<int>(
      firstDelegate,
      exceptionHandler: exceptionHandler,
    );
    final secondRunner = UnaryRunnerAsync<String, int>(
      secondDelegate,
      exceptionHandler: exceptionHandler,
    );

    test('WHEN `Delegate<S>` fails THEN  `onResult() return Failure<T>',
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

      firstDelegate.stub = () => data;
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

      firstDelegate.stub = () => data;
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
