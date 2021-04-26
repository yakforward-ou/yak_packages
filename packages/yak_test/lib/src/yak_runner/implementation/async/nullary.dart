import 'dart:async';

import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';
//  ignore_for_file: avoid_catching_errors

/// a test for `RunnerAsync`
class RunnerAsyncTest<T> implements RunnerTestDelegate<T> {
  /// takes the argument `description`
  RunnerAsyncTest({
    required this.description,
  });

  /// `description` is a `String`
  /// it will be passed to the `test` when runned
  final String description;

  /// `result` is meant for `type` matching and ***must not be null***
  /// it can be anything if `T` is void
  @override
  void call(FutureOr<T> response) {
    group(description, () {
      final reportStub = unaryStub<void, ErrorReport>()..stub = (_) {};
      final errorStub = unaryStub<void, Error>()..stub = (_) {};
      final errorHandler = ErrorHandler<AvowError>(errorStub.wrap);
      final delegate = nullaryStub<Future<T>>();
      final onSuccess = unaryStub<void, T>()..stub = (_) {};

      final runner = RunnerAsync<T>(
        delegate.wrap,
        errorReport: reportStub.wrap,
        errorHandlers: {errorHandler},
        onSuccess: [onSuccess.wrap],
      );

      test('WHEN `void Function()` throws THEN `Result` is `Failure`',
          () async {
        delegate.reset;
        reportStub.reset;

        errorStub.reset;

        delegate.stub = () => throw Exception();

        final result = await runner();

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

        final data = await response;
        delegate.stub = () async => await data;

        final result = await runner();

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

      test(
          'WHEN `Error` of `Type` `errorHandler.type`  is thwon '
          'THEN gets handled', () async {
        delegate.reset;
        reportStub.reset;
        errorStub.reset;

        delegate.stub = () => throw AvowError();

        expect(
          await runner(),
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

        delegate.stub = () async => response;

        await runner();

        expect(
          onSuccess.count,
          1,
          reason: '`onSuccess` should be called once',
        );
      });
    });
  }
}
