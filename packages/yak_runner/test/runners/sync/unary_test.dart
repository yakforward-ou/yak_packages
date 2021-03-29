import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';
//  ignore_for_file: avoid_catching_errors

void main() {
  group('`UnaryRunner`', () {
    const data = 1;
    const res = '$data';
    final exceptionStub = HandleExceptionDelegateStub();
    final delegate = MockUnaryDelegate<String, int>();
    final errorStub = HandleErrorDelegateStub();
    final errorHandler = ErrorHandler<AssertionError>(errorStub);
    final runner = UnaryRunner<String, int>(
      delegate,
      exceptionHandler: exceptionStub,
      errorHandlers: {errorHandler},
    );

    test('WHEN `void Function(T)` throws THEN `Result` is `Failure`', () {
      delegate.reset;
      exceptionStub.reset;
      errorStub.reset;

      delegate.stub = () => throw Exception();
      exceptionStub.stub = () {};
      errorStub.stub = () {};

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
        exceptionStub.callCount,
        1,
        reason: '`exceptionStub` should be called once',
      );
      expect(
        errorStub.callCount,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });

    test('WHEN `void Function()` does not fail `Result` is `Success`', () {
      delegate.reset;
      exceptionStub.reset;
      errorStub.reset;

      delegate.stub = () => res;
      exceptionStub.stub = () {};
      errorStub.stub = () {};

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
        exceptionStub.callCount,
        0,
        reason: '`exceptionStub` should NOT be called ',
      );
      expect(
        errorStub.callCount,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });
    test('WHEN `ERROR` is thwon THEN runner fails', () {
      delegate.reset;
      exceptionStub.reset;
      errorStub.reset;

      delegate.stub = () => throw Error();
      exceptionStub.stub = () {};
      errorStub.stub = () {};

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
        exceptionStub.callCount,
        0,
        reason: '`exceptionStub` should NOT be called ',
      );
      expect(
        errorStub.callCount,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });
    test('WHEN `AssertionError` is thwon THEN gets handled', () {
      delegate.reset;
      exceptionStub.reset;
      errorStub.reset;

      delegate.stub = () => throw AssertionError();
      exceptionStub.stub = () {};
      errorStub.stub = () {};

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
        exceptionStub.callCount,
        0,
        reason: '`exceptionStub` should NOT be called ',
      );
      expect(
        errorStub.callCount,
        1,
        reason: '`errorHandler` should be called once',
      );
    });
  });
}
