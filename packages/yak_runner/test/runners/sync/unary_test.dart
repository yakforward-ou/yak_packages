import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';
//  ignore_for_file: avoid_catching_errors

void main() {
  group('`YakRunnerArg`', () {
    const _data = 1;
    const _res = '$_data';
    final _exceptionHandler = MockExceptionHandler();
    final _delegate = MockUnaryDelegate<String, int>();
    final _errorHandler = MockHandleError<AssertionError>();
    final _runner = YakRunnerArg<String, int>(
      _delegate,
      handleException: _exceptionHandler,
      errorsWhitelist: {_errorHandler},
    );
    when(_exceptionHandler(Object, any)).thenReturn(() {});
    when(_errorHandler(AssertionError())).thenReturn(() {});

    test('WHEN `void Function(T)` throws THEN `Result` is `Failure`', () {
      reset(_exceptionHandler);
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenThrow(Exception());
      final _result = _runner(_data);

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
      verify(_delegate(_data)).called(1);
      verify(_exceptionHandler(Object, any)).called(1);
      verifyZeroInteractions(_errorHandler);
    });

    test('WHEN `void Function()` does not fail `Result` is `Success`', () {
      reset(_exceptionHandler);
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenReturn(_res);

      final _result = _runner(_data);

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

      verify(_delegate(_data)).called(1);
      verifyZeroInteractions(_errorHandler);
      verifyZeroInteractions(_exceptionHandler);
    });
    test('WHEN `ERROR` is thwon THEN runner fails', () {
      reset(_exceptionHandler);
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenThrow(Error());

      Error? err;

      try {
        _runner(_data);
      } on Error catch (e) {
        err = e;
      }

      expect(
        err != null,
        true,
        reason: '`Error` should NOT be handled',
      );

      verify(_delegate(_data)).called(1);
      verifyZeroInteractions(_errorHandler);
      verifyZeroInteractions(_exceptionHandler);
    });

    test('WHEN `AssertionError` is thwon THEN gets handled', () {
      reset(_exceptionHandler);
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenThrow(AssertionError());

      expect(
        _runner(_data),
        isA<Failure>(),
        reason: '`Error` should be handled',
      );

      verify(_delegate(_data)).called(1);
      verify(_errorHandler(AssertionError())).called(1);
      verifyZeroInteractions(_exceptionHandler);
    });
  });
}
