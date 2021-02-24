import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../../mocks/all.dart';
//  ignore_for_file: avoid_catching_errors

/// a test for `YakRunnerAsync`
class YakRunnerAsyncTest<T> implements YakRunnerTestDelegate<T> {
  /// takes the argument `description`
  YakRunnerAsyncTest({
    @required this.description,
  });

  /// `description` is a `String`
  /// it will be passed to the `test` when runned
  final String description;

  /// `result` is meant for `type` matching and ***must not be null***
  /// it can be anything if `T` is void
  @override
  void call(FutureOr<T> result) {
    assert(result != null, 'result must not be null');

    group(description, () {
      final _data = 1;
      final _exceptionHandler = MockExceptionHandler();
      final _errorHandler = MockHandleError<AssertionError>();
      final _delegate = MockDelegate<Future<int>>();
      final _runner = YakRunnerAsync<int>(
        _delegate,
        handleException: _exceptionHandler,
        errorsWhitelist: {_errorHandler},
      );
      when(_exceptionHandler(any, any)).thenAnswer(null);
      verifyNever(_errorHandler(any));
      when(_errorHandler(any)).thenAnswer(null);

      test('WHEN `void Function()` throws THEN `Result` is `Failure`',
          () async {
        reset(_exceptionHandler);
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate()).thenThrow(Exception());
        final _result = await _runner();

        expect(
          _result,
          isNotNull,
          reason: '`_result` must not be null',
        );
        expect(
          _result,
          isNot(Success),
          reason: '`_result` should not be `Success`',
        );
        expect(
          _result,
          isA<Failure>(),
          reason: '`_result` should be `Failure`',
        );

        verify(_delegate()).called(1);
        verifyNever(_errorHandler(any));
        verify(_exceptionHandler(any, any)).called(1);
      });

      test('WHEN `void Function()` does not fail `Result` is `Success`',
          () async {
        reset(_exceptionHandler);
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate()).thenAnswer((_) async => _data);
        final _result = await _runner();

        expect(
          _result,
          isNotNull,
          reason: '`_result` must not be null',
        );
        expect(
          _result,
          isA<Success>(),
          reason: '`_result` should be `Success`',
        );
        expect(
          _result,
          isNot(Failure),
          reason: '`_result` should not be `Failure`',
        );

        verify(_delegate()).called(1);
        verifyNever(_errorHandler(any));
        verifyNever(_exceptionHandler(any, any));
      });

      test('WHEN `ERROR` is thwon THEN runner fails', () async {
        reset(_exceptionHandler);
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate()).thenThrow(Error());

        Error err;

        try {
          await _runner();
        } on Error catch (e) {
          err = e;
        }

        expect(
          err != null,
          true,
          reason: '`Error` should NOT be handled',
        );

        verify(_delegate()).called(1);
        verifyNever(_errorHandler(any));
        verifyNever(_exceptionHandler(any, any));
      });

      test('WHEN `AssertionError` is thwon THEN gets handled', () async {
        reset(_exceptionHandler);
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate()).thenThrow(AssertionError());

        expect(
          await _runner(),
          isA<Failure>(),
          reason: '`Error` should be handled',
        );

        verify(_delegate()).called(1);
        verify(_errorHandler(any)).called(1);
        verifyNever(_exceptionHandler(any, any));
      });
      test(
        'WHEN `fun` is `null` THEN `assert` should `throwsAssertionError`',
        () => expect(
          () => YakRunnerAsync(null),
          throwsA(isA<AssertionError>()),
          reason: '`fun == null` should throw `AssertionError`',
        ),
      );
    });
  }
}
