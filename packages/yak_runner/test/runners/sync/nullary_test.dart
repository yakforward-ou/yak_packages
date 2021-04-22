import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  const data = 1;

  group('`Runner`', () {
    final mockExceptionHandler = MockHandleExceptionDelegate()
      ..stub.stub = (_) {};
    final errorStub = unaryStub<void, Error>()..stub = (_) {};
    final errorHandler = ErrorHandler<AvowError>(errorStub.wrap);
    final delegate = nullaryStub<int>()..stub = () => data;
    final onSuccess = unaryStub<void, int>()..stub = (_) {};

    final runner = Runner<int>(
      delegate.wrap,
      exceptionHandler: mockExceptionHandler,
      errorHandlers: {errorHandler},
      onSuccess: [onSuccess.wrap],
    );

    test('WHEN `void Function()` throws THEN `Result` is `Failure`', () {
      delegate.reset;
      mockExceptionHandler.stub.reset;
      errorStub.reset;

      delegate.stub = () => throw Exception();

      final result = runner();

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
        delegate.count,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        mockExceptionHandler.stub.count,
        1,
        reason: '`mockExceptionHandler` should be called once',
      );
      expect(
        errorStub.count,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });

    test('WHEN `void Function()` does not fail `Result` is `Success`', () {
      delegate.reset;
      mockExceptionHandler.stub.reset;
      errorStub.reset;

      delegate..stub = () => data;
      final result = runner();

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
        delegate.count,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        mockExceptionHandler.stub.count,
        0,
        reason: '`mockExceptionHandler` should NOT be called ',
      );
      expect(
        errorStub.count,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });

    test('WHEN `ERROR` is thwon THEN runner fails', () {
      delegate.reset;
      mockExceptionHandler.stub.reset;
      errorStub.reset;

      delegate.stub = () => throw Error();

      expect(
        runner.call,
        throwsA(isA<Error>()),
        reason: '`Error` should NOT be handled',
      );
      expect(
        delegate.count,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        mockExceptionHandler.stub.count,
        0,
        reason: '`mockExceptionHandler` should NOT be called ',
      );
      expect(
        errorStub.count,
        0,
        reason: '`errorHandler` should NOT be called',
      );
      ;
    });
    test('WHEN `AvowError` is thwon THEN gets handled', () {
      delegate.reset;
      mockExceptionHandler.stub.reset;
      errorStub.reset;

      delegate.stub = () {
        avow(false);
        return 0;
      };

      expect(
        runner(),
        isA<Failure>(),
        reason: '`Error` should be handled',
      );
      expect(
        delegate.count,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        mockExceptionHandler.stub.count,
        0,
        reason: '`mockExceptionHandler` should NOT be called ',
      );
      expect(
        errorStub.count,
        1,
        reason: '`errorHandler` should be called once',
      );
    });
    test(
        'GIVEN `onSuccess` is not empty '
        'WHEN `Result` is `Success` '
        'THEN `onSuccess` is called', () {
      delegate.reset;
      mockExceptionHandler.stub.reset;
      errorStub.reset;
      onSuccess.reset;

      delegate.stub = () => data;

      runner();

      expect(
        onSuccess.count,
        1,
        reason: '`onSuccess` should be called once',
      );
    });
  });
}
