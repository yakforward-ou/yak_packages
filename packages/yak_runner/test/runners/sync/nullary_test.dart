import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';
//  ignore_for_file: avoid_catching_errors

void main() {
  group('`YakRunner`', () {
    final _data = 1;
    final _exceptionHandler = MockExceptionHandler();
    final _delegate = MockDelegate<int>();
    final _errorHandler = MockHandleError<AssertionError>();
    final _runner = YakRunner(
      _delegate,
      _exceptionHandler,
      {_errorHandler},
    );
    when(_exceptionHandler(any, any)).thenAnswer(null);
    when(_errorHandler(any)).thenAnswer(null);

    test('WHEN `void Function()` throws THEN `Result` is `Failure`', () {
      reset(_exceptionHandler);
      reset(_errorHandler);

      reset(_delegate);

      when(_delegate()).thenThrow(Exception());
      final _result = _runner();

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
      verify(_exceptionHandler(any, any)).called(1);
    });

    test('WHEN `void Function()` does not fail `Result` is `Success`', () {
      reset(_exceptionHandler);
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate()).thenReturn(_data);
      final _result = _runner();

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
      verifyNever(_exceptionHandler(any, any));
    });

    test('WHEN `ERROR` is thwon THEN runner fails', () {
      reset(_exceptionHandler);
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate()).thenThrow(Error());

      Error err;

      try {
        _runner();
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

    test('WHEN `AssertionError` is thwon THEN gets handled', () {
      reset(_exceptionHandler);
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate()).thenThrow(AssertionError());

      expect(
        _runner(),
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
        () => YakRunner(null),
        throwsA(isA<AssertionError>()),
        reason: '`fun == null` should throw `AssertionError`',
      ),
    );
  });
}
