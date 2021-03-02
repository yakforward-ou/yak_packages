import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';
//  ignore_for_file: avoid_catching_errors

void main() {
  group('`YakRunnerAsync`', () {
    const _data = 1;
    final _exceptionHandler = MockExceptionHandler();
    final _errorHandler = MockHandleError<AssertionError>();
    final _delegate = MockDelegate<Future<int>>();
    final _runner = YakRunnerAsync<int>(
      _delegate,
      handleException: _exceptionHandler,
      errorsWhitelist: {_errorHandler},
    );
    when(_exceptionHandler(Object, any)).thenReturn(() {});
    when(_errorHandler(AssertionError())).thenReturn(() {});

    test('WHEN `void Function()` throws THEN `Result` is `Failure`', () async {
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
      verify(_exceptionHandler(Object, any)).called(1);
      verifyZeroInteractions(_errorHandler);
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
      verifyZeroInteractions(_errorHandler);
      verifyZeroInteractions(_exceptionHandler);
    });

    test('WHEN `ERROR` is thwon THEN runner fails', () async {
      reset(_exceptionHandler);
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate()).thenThrow(Error());

      Error? err;

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
      verifyZeroInteractions(_errorHandler);
      verifyZeroInteractions(_exceptionHandler);
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
      verify(_errorHandler(AssertionError())).called(1);
      verifyZeroInteractions(_exceptionHandler);
    });
  });
}
