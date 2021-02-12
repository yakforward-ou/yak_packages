import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  final _data = 1;
  final _res = '$_data';
  final _errorHandler = MockErrorHandler();
  when(_errorHandler(any, any)).thenAnswer(null);

  group('`onFutureResult` EXTENSION', () {
    final _firstDelegate = MockDelegate<Future<int>>();

    final _secondDelegate = MockUnaryDelegate<Future<String>, FutureOr<int>>();
    final _firstRunner = YakRunnerAsync<int>(_firstDelegate, _errorHandler);

    final _secondRunner =
        YakRunnerArgAsync<String, int>(_secondDelegate, _errorHandler);

    test('WHEN `Delegate<Future<S>>` fails THEN  `onResult() return Failure<T>',
        () async {
      reset(_errorHandler);
      reset(_firstDelegate);
      reset(_secondDelegate);

      when(_firstDelegate()).thenThrow(Exception());
      when(_secondDelegate(_data)).thenAnswer((_) async => _res);

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

      verify(_firstDelegate()).called(1);
      verify(_errorHandler(any, any)).called(1);
      verifyZeroInteractions(_secondDelegate);
    });

    test(
        'WHEN `ArgDelegate<Future<T>,FutureOr<S>>` fail '
        'THEN  `onResult() return Failure<T>', () async {
      reset(_errorHandler);
      reset(_firstDelegate);
      reset(_secondDelegate);

      when(_firstDelegate()).thenAnswer((_) async => _data);
      when(_secondDelegate(_data)).thenThrow(Exception());

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

      verify(_firstDelegate()).called(1);
      verify(_secondDelegate(_data)).called(1);
      verify(_errorHandler(any, any)).called(1);
    });

    test(
        'WHEN `ArgDelegate<Future<T>,FutureOr<S>>` does not fail '
        'THEN  `onResult() return Success<T>', () async {
      reset(_errorHandler);
      reset(_firstDelegate);
      reset(_secondDelegate);

      when(_firstDelegate()).thenAnswer((_) async => _data);
      when(_secondDelegate(_data)).thenAnswer((_) async => _res);

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

      verify(_firstDelegate()).called(1);
      verify(_secondDelegate(_data)).called(1);
      verifyZeroInteractions(_errorHandler);
    });
  });
}
