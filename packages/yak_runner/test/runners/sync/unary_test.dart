import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_result/yak_result.dart';

//  ignore_for_file: avoid_catching_errors

void main() {
  group('`UnaryRunner`', () {
    const data = 1;
    final reportStub = unaryStub<void, ErrorReport>()..stub = (_) {};

    final errorStub = unaryStub<void, Error>()..stub = (_) {};
    final errorHandler = ErrorHandler<AvowError>(errorStub.wrap);
    final delegate = unaryStub<String, int>();
    final onSuccess = unaryStub<void, String>()..stub = (_) {};

    final runner = UnaryRunner<String, int>(
      delegate.wrap,
      errorReport: reportStub.wrap,
      errorHandlers: {errorHandler},
      onSuccess: [onSuccess.wrap],
    );

    test('WHEN `void Function(T)` throws THEN `Result` is `Failure`', () {
      delegate.reset;
      reportStub.reset;
      errorStub.reset;

      delegate.reset;
      reportStub..reset;
      errorStub.reset;

      delegate.stub = (i) => throw Exception();

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
        delegate.count,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        reportStub.count,
        1,
        reason: '`exceptionStub` should be called once',
      );
      expect(
        errorStub.count,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });

    test('WHEN `void Function()` does not fail `Result` is `Success`', () {
      delegate.reset;
      reportStub.reset;
      errorStub.reset;

      delegate.stub = (i) => '$i';

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
        delegate.count,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        reportStub.count,
        0,
        reason: '`exceptionStub` should NOT be called ',
      );
      expect(
        errorStub.count,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });
    test('WHEN `ERROR` is thwon THEN runner fails', () {
      delegate.reset;
      reportStub.reset;
      errorStub.reset;

      delegate.stub = (_) => throw Error();

      expect(
        () => runner(data),
        throwsA(isA<Error>()),
        reason: '`Error` should NOT be handled',
      );
      expect(
        delegate.count,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        reportStub.count,
        0,
        reason: '`exceptionStub` should NOT be called ',
      );
      expect(
        errorStub.count,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });
    test('WHEN `AvowError` is thwon THEN gets handled', () {
      delegate.reset;
      reportStub.reset;
      errorStub.reset;

      delegate.stub = (i) {
        avow(false);
        return '$i';
      };

      expect(
        runner(data),
        isA<Failure>(),
        reason: '`Error` should be handled',
      );

      expect(
        delegate.count,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        reportStub.count,
        0,
        reason: '`exceptionStub` should NOT be called ',
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
      reportStub.reset;
      errorStub.reset;
      onSuccess.reset;

      delegate.stub = (i) => '$i';

      runner(data);

      expect(
        onSuccess.count,
        1,
        reason: '`onSuccess` should be called once',
      );
    });

    test(
        'GIVEN `ErrorHandler<T>` `eport: true` '
        'WHEN Function throws `T` '
        'THEN `errorReport` is called', () {
      delegate.reset;
      reportStub.reset;
      errorStub.reset;
      onSuccess.reset;

      final errorHandler = ErrorHandler<AvowError>(
        errorStub.wrap,
        report: true,
      );

      final _runner = runner.copyWith(errorHandlers: {errorHandler});

      delegate.stub = (i) {
        avow(false);
        return '$i';
      };

      _runner(data);

      expect(
        reportStub.count,
        1,
        reason: '`report` should be called once',
      );
    });
  });
}
