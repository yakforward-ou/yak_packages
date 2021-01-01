import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:meta/meta.dart';
import '../../../mock/mock_error_handler.dart';
import '../../../mock/mock_future_arg_delegate.dart';
import '../../../mock/mock_future_delegate.dart';

/// a class that runs test for `TryAnyRunArgAsync`

class TryAnyRunArgAsyncTester<T, S> implements ArgResultTestDelegate<T, S> {
  const TryAnyRunArgAsyncTester({
    @required this.description,
  });
  final String description;

  void call(FutureOr<T> result, FutureOr<S> arg) {
    group(description, () {
      final _errorHandler = MockErrorHandler();
      final _argDelegate = MockFutureDelegate<S>();
      final _funDelegate = MockFutureArgDelegate<T, S>();
      final _tryRun = TryAnyRunArgAsync<T, S>(_funDelegate, _errorHandler);

      test('WHEN `args` throws THEN ***error is not cought***', () async {
        clearInteractions(_errorHandler);
        clearInteractions(_argDelegate);
        clearInteractions(_funDelegate);

        when(_argDelegate.call()).thenThrow('ops');
        when(_funDelegate.call(arg)).thenAnswer((s) async => result);

        var _result;
        var _error;
        try {
          _result = await _tryRun(_argDelegate());
        } catch (_, __) {
          _error = true;
        }

        expect(_result != null, false);
        expect(_error != null, true);

        verify(_argDelegate.call()).called(1);
        verifyNoMoreInteractions(_argDelegate);
        verifyZeroInteractions(_funDelegate);
        verifyZeroInteractions(_errorHandler);
      });

      test('WHEN `void Function(S)` throws THEN `Try` is `Failure`', () async {
        clearInteractions(_errorHandler);
        clearInteractions(_argDelegate);
        clearInteractions(_funDelegate);

        when(_argDelegate.call()).thenAnswer((realInvocation) async => arg);
        when(_funDelegate.call(arg)).thenThrow('ops');

        final _result = await _tryRun(_argDelegate());

        expect(_result != null, true, reason: '`_result` must not be null');
        expect(_result is Success, false);
        expect(_result is Failure, true);

        var _resultData;
        var _resultFail;
        _result.when(
            result: (data) => _resultData = data,
            failure: (_, s) => _resultFail = s);

        expect(_resultData != null, false);
        expect(_resultFail != null, true);

        verify(_argDelegate.call()).called(1);
        verifyNoMoreInteractions(_argDelegate);
        verify(_funDelegate.call(arg)).called(1);
        verifyNoMoreInteractions(_funDelegate);
        verify(_errorHandler.call(any, any)).called(1);
        verifyNoMoreInteractions(_errorHandler);
      });

      test('WHEN `void Function(S)` does not fail `Try` is `Success`',
          () async {
        clearInteractions(_errorHandler);
        clearInteractions(_argDelegate);
        clearInteractions(_funDelegate);

        when(_argDelegate.call()).thenAnswer((_) => arg);
        when(_funDelegate.call(arg)).thenAnswer((s) async => result);

        final _result = await _tryRun(_argDelegate());

        expect(_result != null, true, reason: '`_result` must not be null');
        expect(_result is Success, true);
        expect(_result is Failure, false);

        var _resultData;
        var _resultFail;
        _result.when(
            result: (data) => _resultData = data,
            failure: (_, s) => _resultFail = s);

        expect(_resultData != null, true);
        expect(_resultFail != null, false);

        verify(_argDelegate.call()).called(1);
        verifyNoMoreInteractions(_argDelegate);
        verify(_funDelegate.call(arg)).called(1);
        verifyNoMoreInteractions(_funDelegate);
        verifyZeroInteractions(_errorHandler);
      });
    });
  }
}
