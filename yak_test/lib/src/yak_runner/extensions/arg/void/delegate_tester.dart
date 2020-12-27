import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:meta/meta.dart';
import '../../base/mock_arg_delegate.dart';
import '../../base/mock_delegate.dart';
import '../../base/mock_error_handler.dart';

class TryRunArgTester<T> {
  const TryRunArgTester({
    @required this.description,
    @required this.arg,
  });
  final String description;
  final T arg;

  void call() {
    group(description, () {
      final _errorHandler = MockErrorHandler();
      final _argDelegate = MockDelegate<T>();
      final _funDelegate = MockArgDelegate<void, T>();
      final _tryRun = TryRunArg<T>(_funDelegate, _errorHandler);

      when(_errorHandler.call(any, any)).thenAnswer((_) {});

      test('WHEN `args` throws THEN ***error is not cought***', () {
        clearInteractions(_errorHandler);
        clearInteractions(_argDelegate);
        clearInteractions(_funDelegate);

        when(_argDelegate.call()).thenThrow('ops');
        when(_funDelegate.call(any)).thenAnswer((s) {});

        var _result;
        var _error;
        try {
          _result = _tryRun(_argDelegate());
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

      test('WHEN `void Function(S)` throws THEN `Try` is `Failure`', () {
        clearInteractions(_errorHandler);
        clearInteractions(_argDelegate);
        clearInteractions(_funDelegate);

        when(_argDelegate.call()).thenAnswer((realInvocation) => arg);
        when(_funDelegate.call(any)).thenThrow('ops');

        final _result = _tryRun(_argDelegate());

        expect(_result != null, true, reason: '`_result` must not be null');
        expect(_result is Success, false);
        expect(_result is Failure, true);

        var _resultData;
        var _resultFail;
        _result.when(
            success: () => _resultData = true,
            failure: (_, s) => _resultFail = s);

        expect(_resultData != null, false);
        expect(_resultFail != null, true);

        verify(_argDelegate.call()).called(1);
        verifyNoMoreInteractions(_argDelegate);
        verify(_funDelegate.call(any)).called(1);
        verifyNoMoreInteractions(_funDelegate);
        verify(_errorHandler.call(any, any)).called(1);
        verifyNoMoreInteractions(_errorHandler);
      });

      test('WHEN `void Function(S)` does not fail `Try` is `Success`', () {
        clearInteractions(_errorHandler);
        clearInteractions(_argDelegate);
        clearInteractions(_funDelegate);

        when(_argDelegate.call()).thenAnswer((_) => arg);
        when(_funDelegate.call(any)).thenAnswer((s) {});

        final _result = _tryRun(_argDelegate());

        expect(_result != null, true, reason: '`_result` must not be null');
        expect(_result is Success, true);
        expect(_result is Failure, false);

        var _resultData;
        var _resultFail;
        _result.when(
            success: () => _resultData = true,
            failure: (_, s) => _resultFail = s);

        expect(_resultData != null, true);
        expect(_resultFail != null, false);

        verify(_argDelegate.call()).called(1);
        verifyNoMoreInteractions(_argDelegate);
        verify(_funDelegate.call(any)).called(1);
        verifyNoMoreInteractions(_funDelegate);
        verifyZeroInteractions(_errorHandler);
      });
    });
  }
}
