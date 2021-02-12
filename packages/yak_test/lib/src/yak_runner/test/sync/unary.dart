import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../../mocks/all.dart';

/// a test for `YakRunnerArg`
class YakRunnerArgTest<T, S> implements YakRunnerArgTestDelegate<T, S> {
  /// takes the argument `description`

  YakRunnerArgTest({
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
      final _errorHandler = MockCatch();
      final _delegate = MockUnaryDelegate<T, S>();
      final _runner = YakRunnerArg<T, S>(_delegate, _errorHandler);
      when(_errorHandler(any, any)).thenAnswer(null);

      test('WHEN `void Function(T)` throws THEN `Result` is `Failure`', () {
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate(arg)).thenThrow(Exception());
        final _result = _runner(arg);

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

        verify(_delegate(arg)).called(1);
        verify(_errorHandler(any, any)).called(1);
      });

      test('WHEN `void Function()` does not fail `Result` is `Success`', () {
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate(arg)).thenReturn(result);

        final _result = _runner(arg);

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

        verify(_delegate(arg)).called(1);
        verifyZeroInteractions(_errorHandler);
      });
    });
  }
}
