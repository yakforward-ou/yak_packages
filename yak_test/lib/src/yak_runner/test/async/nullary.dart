import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../../shared/all.dart';

/// a test for `YakRunnerAsync`

class YakRunnerAsyncTest<T> implements YakRunnerTestDelegate<T> {
  YakRunnerAsyncTest({
    @required this.description,
  });
  final String description;

  /// `result` is meant for `type` matching and ***must not be null***
  /// it can be anything if `T` is void
  @override
  void call(FutureOr<T> result) {
    assert(result != null, 'result must not be null');

    group(description, () {
      final _errorHandler = MockCatch();
      final _delegate = MockDelegate<Future<T>>();
      final _runner = YakRunnerAsync<T>(_delegate, _errorHandler);
      when(_errorHandler(any, any)).thenAnswer(null);

      test('WHEN `Future<T> Function()` throws THEN `Result` is `Failure`',
          () async {
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate()).thenThrow('ops');
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

      test('WHEN `T Function()` does not fail `Result` is `Success`', () async {
        reset(_errorHandler);
        reset(_delegate);

        when(_delegate()).thenAnswer((_) async => result);

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
