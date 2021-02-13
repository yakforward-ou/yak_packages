import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../../mocks/all.dart';

/// a test for `YakRunner`
class YakRunnerTest<T> implements YakRunnerTestDelegate<T> {
  /// takes the argument `description`
  YakRunnerTest({
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
      final _errorHandler = MockCatch();
      final _delegate = MockDelegate<T>();
      final _runner = YakRunner<T>(_delegate, _errorHandler);
      when(_errorHandler(any, any)).thenAnswer(null);

      test('WHEN `T Function()` throws THEN `Result` is `Failure`', () {
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

        var _success;
        var _failure;

        _result.when(
          success: (data) => _success = data,
          failure: (_, s) => _failure = s,
        );

        expect(_success != null, false,
            reason: '`success:`should not be called');
        expect(_failure != null, true, reason: '`failure:`should be called');

        verify(_delegate()).called(1);
        verify(_errorHandler(any, any)).called(1);
      });

      test('WHEN `T Function()` does not fail `Result` is `Success`', () {
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate()).thenReturn(result);

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

        var _success;
        var _failure;

        _result.when(
          success: (data) => _success = data,
          failure: (_, s) => _failure = s,
        );

        expect(_failure != null, false,
            reason: '`failure:`should not be called');

        T != typeVoid
            ? expect(_success, isA<T>(),
                reason: '`success:`should be of type `T`')
            : expect(_success != null, true,
                reason: '`success:`should be called');

        verify(_delegate()).called(1);
        verifyZeroInteractions(_errorHandler);
      });
    });
  }
}
