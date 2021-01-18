import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../../shared/all.dart';

class YakRunnerArgAsyncTest<T, S> implements YakRunnerArgTestDelegate<T, S> {
  YakRunnerArgAsyncTest({
    @required this.description,
  });
  final String description;

  /// `arg` and `result` are meant for `type` matching and ***must not be null***
  /// `result` can be anything if `T` is void
  @override
  void call(FutureOr<T> result, FutureOr<S> arg) {
    assert(result != null, 'result must not be null');
    assert(arg != null, 'result must not be null');

    group(description, () {
      final _errorHandler = MockCatch();
      final _delegate = MockUnaryDelegate<Future<T>, FutureOr<S>>();
      final _runner = YakRunnerArgAsync<T, S>(_delegate, _errorHandler);
      when(_errorHandler(any, any)).thenAnswer(null);

      test('WHEN `void Function(T)` throws THEN `Result` is `Failure`',
          () async {
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate(arg)).thenThrow('throwable');
        final _result = await _runner(arg);

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

      test('WHEN `void Function()` does not fail `Result` is `Success`',
          () async {
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate(arg)).thenAnswer((_) async => result);

        final _result = await _runner(arg);

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
