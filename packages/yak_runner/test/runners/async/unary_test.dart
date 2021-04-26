import 'dart:async';

import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  const data = 1;
  group('`UnaryRunnerAsync`', () {
    final reportStub = unaryStub<void, ErrorReport>()..stub = (_) {};
    final errorStub = unaryStub<void, Error>()..stub = (_) {};
    final errorHandler = ErrorHandler<AvowError>(errorStub.wrap);
    final delegate = unaryStub<Future<String>, FutureOr<int>>();
    final onSuccess = unaryStub<void, String>()..stub = (_) async {};

    final runner = UnaryRunnerAsync<String, int>(
      delegate.wrap,
      errorReport: reportStub.wrap,
      errorHandlers: {errorHandler},
      onSuccess: [onSuccess.wrap],
    );

    test('WHEN `void Function(T)` throws THEN `Result` is `Failure`', () async {
      delegate.reset;
      reportStub.reset;
      errorStub.reset;

      delegate.stub = (i) async => throw Exception();

      final result = await runner(data);

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
        reason: '`mockExceptionHandler` should be called once',
      );
      expect(
        errorStub.count,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });

    test('WHEN `void Function()` does not fail `Result` is `Success`',
        () async {
      delegate.reset;
      reportStub.reset;
      errorStub.reset;

      delegate.stub = (i) async => '';

      final result = await runner(data);

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
        reason: '`mockExceptionHandler` should NOT be called ',
      );
      expect(
        errorStub.count,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });
    test('WHEN `ERROR` is thwon THEN runner fails', () async {
      delegate.reset;
      reportStub..reset;
      errorStub.reset;

      delegate.stub = (_) => throw Error();

      late final err;

      try {
        await runner(data);
        // ignore: avoid_catching_errors
      } on Error catch (e) {
        err = e;
      }

      expect(
        err,
        isA<Error>(),
        reason: '`Error` should NOT be handled',
      );

      /// see issue `iapicca/yak_packages/issues/89`
      // expect(
      //   () => runner(data),
      //   throwsA(isA<Error>()),
      //   reason: '`Error` should NOT be handled',
      // );
      expect(
        delegate.count,
        1,
        reason: '`delegate` should be called once',
      );
      expect(
        reportStub.count,
        0,
        reason: '`mockExceptionHandler` should NOT be called ',
      );
      expect(
        errorStub.count,
        0,
        reason: '`errorHandler` should NOT be called',
      );
    });

    test('WHEN `AvowError` is thwon THEN gets handled', () async {
      delegate.reset;
      reportStub.reset;
      errorStub.reset;

      delegate.stub = (i) async {
        avow(false);
        return '$i';
      };

      expect(
        await runner(data),
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
        'THEN `onSuccess` is called', () async {
      delegate.reset;
      reportStub.reset;
      errorStub.reset;
      onSuccess.reset;

      delegate.stub = (i) async => '$i';

      await runner(data);

      expect(
        onSuccess.count,
        1,
        reason: '`onSuccess` should be called once',
      );
    });
    test(
        'GIVEN `ErrorHandler<T>` `report: true` '
        'WHEN Function throws `T` '
        'THEN `errorReport` is called', () async {
      delegate.reset;
      reportStub.reset;
      errorStub.reset;
      onSuccess.reset;

      final _errorHandler = ErrorHandler<AvowError>(
        errorStub.wrap,
        report: true,
      );

      final _runner = runner.copyWith(errorHandlers: {_errorHandler});

      delegate.stub = (i) async {
        avow(false);
        return '$i';
      };

      await _runner(data);

      expect(
        reportStub.count,
        1,
        reason: '`report` should be called once',
      );
    });
  });
}
