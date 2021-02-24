import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../../mocks/all.dart';
//  ignore_for_file: avoid_catching_errors

/// a test for `YakRunnerArgAsync`
class YakRunnerArgAsyncTest<T, S> implements YakRunnerArgTestDelegate<T, S> {
  /// takes the argument `description`
  YakRunnerArgAsyncTest({
    @required this.description,
  });

  /// `description` is a `String`
  /// it will be passed to the `test` when runned
  final String description;

  /// `arg` and `result` are meant for `type` matching and *must not be null*
  /// `result` can be anything if `T` is void
  @override
  void call(FutureOr<T> result, FutureOr<S> arg) {
    assert(result != null, 'result must not be null');
    assert(arg != null, 'result must not be null');

    group(description, () {
      final _exceptionHandler = MockExceptionHandler();
      final _errorHandler = MockHandleError<AssertionError>();

      final _delegate = MockUnaryDelegate<Future<T>, FutureOr<S>>();
      final _runner = YakRunnerArgAsync<T, S>(
        _delegate,
        handleException: _exceptionHandler,
        errorsWhitelist: {_errorHandler},
      );
      when(_exceptionHandler(any, any)).thenAnswer(null);
      when(_errorHandler(any)).thenAnswer(null);

      test('WHEN `void Function(T)` throws THEN `Result` is `Failure`',
          () async {
        reset(_exceptionHandler);
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate(arg)).thenThrow(Exception());
        final _result = await _runner(arg);

        expect(
          _result,
          isNotNull,
          reason: '`result` must not be null',
        );
        expect(
          _result,
          isNot(Success),
          reason: '`result` should not be `Success`',
        );
        expect(
          _result,
          isA<Failure>(),
          reason: '`result` should be `Failure`',
        );

        verify(_delegate(arg)).called(1);
        verify(_exceptionHandler(any, any)).called(1);
      });

      test('WHEN `void Function()` does not fail `Result` is `Success`',
          () async {
        reset(_exceptionHandler);
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate(arg)).thenAnswer((_) async => result);

        final _result = await _runner(arg);

        expect(
          _result,
          isNotNull,
          reason: '`result` must not be null',
        );
        expect(
          _result,
          isA<Success>(),
          reason: '`result` should be `Success`',
        );
        expect(
          _result,
          isNot(Failure),
          reason: '`result` should not be `Failure`',
        );

        verify(_delegate(arg)).called(1);
        verifyNever(_exceptionHandler(any, any));
      });
      test('WHEN `ERROR` is thwon THEN runner fails', () async {
        reset(_exceptionHandler);
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate(arg)).thenThrow(Error());

        Error err;

        try {
          await _runner(arg);
        } on Error catch (e) {
          err = e;
        }

        expect(
          err != null,
          true,
          reason: '`Error` should NOT be handled',
        );

        verify(_delegate(arg)).called(1);
        verifyNever(_errorHandler(any));
        verifyNever(_exceptionHandler(any, any));
      });

      test('WHEN `AssertionError` is thwon THEN gets handled', () async {
        reset(_exceptionHandler);
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate(arg)).thenThrow(AssertionError());

        expect(
          await _runner(arg),
          isA<Failure>(),
          reason: '`Error` should be handled',
        );

        verify(_delegate(arg)).called(1);
        verify(_errorHandler(any)).called(1);
        verifyNever(_exceptionHandler(any, any));
      });
      test(
        'WHEN `fun` is `null` THEN `assert` should `throwsAssertionError`',
        () => expect(
          () => YakRunnerArgAsync(null),
          throwsA(isA<AssertionError>()),
          reason: '`fun == null` should throw `AssertionError`',
        ),
      );

      test(
          'WHEN `call` -> `arg` is `null` '
          'THEN `assert` should `throwsAssertionError`', () {
        final runner = YakRunnerArgAsync<String, int>((i) async => 'i');
        expect(
          () => runner(null),
          throwsA(isA<AssertionError>()),
          reason: '`arg == null` should throw `AssertionError`',
        );
      });
    });
  }
}
