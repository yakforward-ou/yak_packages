import 'dart:async';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  const _data = 1;
  const _res = '$_data';
  final _exceptionHandler = MockExceptionHandler();
  when(_exceptionHandler).calls(#call).thenAnswer((i) {});

  group('`onFutureResult` EXTENSION', () {
    final _firstDelegate = MockDelegate<Future<int>>();

    final _secondDelegate = MockUnaryDelegate<Future<String>, FutureOr<int>>();
    final _firstRunner = YakRunnerAsync<int>(
      _firstDelegate,
      handleException: _exceptionHandler,
    );

    final _secondRunner = YakRunnerArgAsync<String, int>(
      _secondDelegate,
      handleException: _exceptionHandler,
    );

    test('WHEN `Delegate<Future<S>>` fails THEN  `onResult() return Failure<T>',
        () async {
      reset(_exceptionHandler);
      reset(_firstDelegate);
      reset(_secondDelegate);

      when(_firstDelegate).calls(#call).thenThrow(Exception());
      when(_secondDelegate).calls(#call).thenAnswer((any) async => _res);

      final _result =
          await _firstRunner().onFutureResult<String>(_secondRunner);

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
        _result is Failure<int>,
        false,
        reason: '`_result`should not be `Failure<S>`',
      );
      expect(
        _result,
        isA<Failure<String>>(),
        reason: '`_result` should be `Failure<T>`',
      );

      verify(_firstDelegate).called(#call).once();
      verify(_secondDelegate).called(#call).never();

      verify(_exceptionHandler).called(#call).once();
    });

    test(
        'WHEN `ArgDelegate<Future<T>,FutureOr<S>>` fail '
        'THEN  `onResult() return Failure<T>', () async {
      reset(_exceptionHandler);
      reset(_firstDelegate);
      reset(_secondDelegate);

      when(_firstDelegate).calls(#call).thenAnswer((_) async => _data);
      when(_secondDelegate).calls(#call).thenThrow(Exception());

      final _result =
          await _firstRunner().onFutureResult<String>(_secondRunner);

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
        _result is Failure<int>,
        false,
        reason: '`_result`should not be `Failure<S>`',
      );
      expect(
        _result,
        isA<Failure<String>>(),
        reason: '`_result` should be `Failure<T>`',
      );

      verify(_firstDelegate).called(#call).once();
      verify(_secondDelegate).called(#call).once();

      verify(_exceptionHandler).called(#call).once();
    });

    test(
        'WHEN `ArgDelegate<Future<T>,FutureOr<S>>` does not fail '
        'THEN  `onResult() return Success<T>', () async {
      reset(_exceptionHandler);
      reset(_firstDelegate);
      reset(_secondDelegate);

      when(_firstDelegate).calls(#call).thenAnswer((_) async => _data);
      when(_secondDelegate).calls(#call).thenAnswer((_) async => _res);

      final _result =
          await _firstRunner().onFutureResult<String>(_secondRunner);

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
      verify(_firstDelegate).called(#call).once();
      verify(_secondDelegate).called(#call).once();

      verify(_exceptionHandler).called(#call).never();
    });
  });
}
