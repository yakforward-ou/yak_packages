import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';
//  ignore_for_file: avoid_catching_errors

void main() {
  group('`YakRunnerArg`', () {
    const data = 1;
    const res = '$data';
    final exceptionHandler = MockExceptionHandler();
    final delegate = MockUnaryDelegate<String, int>();
    final errorHandler = MockHandleError<AssertionError>();
    final runner = YakRunnerArg<String, int>(
      delegate,
      handleException: exceptionHandler,
      errorsWhitelist: {errorHandler},
    );

    test('WHEN `void Function(T)` throws THEN `Result` is `Failure`', () {
      delegate.reset;
      exceptionHandler.reset;
      errorHandler.reset;

      delegate.stub = () => throw Exception();
      exceptionHandler.stub = () {};
      errorHandler.stub = () {};

      final result = runner(data);

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
        result,
        isA<Failure>(),
        reason: '`result` should be `Failure`',
      );
      expect(
        delegate.callCount,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        exceptionHandler.callCount,
        1,
        reason: '`exceptionHandler` should be called once',
      );
      expect(
        errorHandler.callCount,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });

    test('WHEN `void Function()` does not fail `Result` is `Success`', () {
      delegate.reset;
      exceptionHandler.reset;
      errorHandler.reset;

      delegate.stub = () => res;
      exceptionHandler.stub = () {};
      errorHandler.stub = () {};

      final result = runner(data);

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
        delegate.callCount,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        exceptionHandler.callCount,
        0,
        reason: '`exceptionHandler` should NOT be called ',
      );
      expect(
        errorHandler.callCount,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });
    test('WHEN `ERROR` is thwon THEN runner fails', () {
      delegate.reset;
      exceptionHandler.reset;
      errorHandler.reset;

      delegate.stub = () => throw Error();
      exceptionHandler.stub = () {};
      errorHandler.stub = () {};

      Error? err;

      try {
        runner(data);
      } on Error catch (e) {
        err = e;
      }

      expect(
        err != null,
        true,
        reason: '`Error` should NOT be handled',
      );
      expect(
        delegate.callCount,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        exceptionHandler.callCount,
        0,
        reason: '`exceptionHandler` should NOT be called ',
      );
      expect(
        errorHandler.callCount,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });
    test('WHEN `AssertionError` is thwon THEN gets handled', () {
      delegate.reset;
      exceptionHandler.reset;
      errorHandler.reset;

      delegate.stub = () => throw AssertionError();
      exceptionHandler.stub = () {};
      errorHandler.stub = () {};

      expect(
        runner(data),
        isA<Failure>(),
        reason: '`Error` should be handled',
      );

      expect(
        delegate.callCount,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        exceptionHandler.callCount,
        0,
        reason: '`exceptionHandler` should NOT be called ',
      );
      expect(
        errorHandler.callCount,
        1,
        reason: '`errorHandler` should be called once',
      );
    });
  });
}
