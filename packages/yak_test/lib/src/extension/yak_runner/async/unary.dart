import 'dart:async';

import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

// coverage:ignore-file

/// a `typedef` for a `UnaryRunner``tester` function
typedef UnaryRunnerAsyncTest<T, S> = void Function({
  String description,
  Future<T> Function(FutureOr<S>) example,
  S argument,
});

/// an `extension` that allows to seamlessly run a comprehensive set of tests
/// for `UnaryRunnerAsync`
extension UnaryRunnerAsyncTesterX<T, S> on UnaryRunnerAsync<T, S> {
  /// run `test` providing a `description`, an `example` function
  /// and an example `argument`
  void tester({
    required String description,
    required Future<T> Function(FutureOr<S>) example,
    required S argument,
  }) {
    final reportStub = unaryStub<void, ErrorReport>()..stub = (_) {};
    final errorStub = unaryStub<void, Error>()..stub = (_) {};
    final errorHandler = ErrorHandler<AvowError>(errorStub.wrap);
    final onSuccess = unaryStub<void, T>()..stub = (_) {};
    final delegate = unaryStub<Future<T>, FutureOr<S>>();

    final runner = UnaryRunnerAsync<T, S>(
      delegate.wrap,
      errorReport: reportStub.wrap,
      errorHandlers: {errorHandler},
      onSuccess: [onSuccess.wrap],
    );

    group(description, () {
      test('WHEN `void Function(T)` throws THEN `Result` is `Failure`',
          () async {
        delegate.reset;
        reportStub.reset;
        errorStub.reset;

        delegate.stub = (_) => throw Exception();

        final result = await runner(argument);

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

        delegate.stub = example;

        final result = await runner(argument);

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
        reportStub.reset;

        errorStub.reset;
        delegate.stub = (_) => throw Error();

        expect(
          () async => await runner(argument),
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

        delegate.stub = (_) => throw AvowError();

        expect(
          await runner(argument),
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

        delegate.stub = example;

        await runner(argument);
        expect(
          onSuccess.count,
          1,
          reason: '`onSuccess` should be called once',
        );
      });
    });
  }
}
