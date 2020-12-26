import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../base/mock_error_handler.dart';
import '../../base/mock_future_delegate.dart';

import 'package:meta/meta.dart';

class TryAnyRunAsyncTester<T> {
  const TryAnyRunAsyncTester({
    @required this.description,
    @required this.result,
  });
  final String description;
  final T result;

  void call() {
    group(description, () {
      final _errorHandler = MockErrorHandler();
      final _delegate = MockFutureDelegate<T>();
      final _tryRun = TryAnyRunAsync(_delegate, _errorHandler);
      test('WHEN `void Function()` throws THEN `Try` is `Failure`', () async {
        clearInteractions(_errorHandler);
        clearInteractions(_delegate);

        when(_delegate.call()).thenThrow('ops');
        final _result = await _tryRun();

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

        verify(_delegate.call()).called(1);
        verifyNoMoreInteractions(_delegate);
        verify(_errorHandler.call(any, any)).called(1);
        verifyNoMoreInteractions(_errorHandler);
      });

      test('WHEN `void Function()` does not fail `Try` is `Success`', () async {
        clearInteractions(_errorHandler);
        clearInteractions(_delegate);

        when(_delegate.call()).thenAnswer((_) async => result);
        final _result = await _tryRun();

        expect(_result != null, true, reason: '`_result` must not be null');
        expect(_result is Success, true);
        expect(_result is Failure, false);

        var _resultData;
        var _resultFail;
        _result.when(
            result: (data) => _resultData = data,
            failure: (_, s) => _resultFail = s);

        expect(_resultData != null, true);
        expect(_resultData, result);
        expect(_resultFail != null, false);

        verify(_delegate.call()).called(1);
        verifyNoMoreInteractions(_delegate);
        verifyZeroInteractions(_errorHandler);
      });
    });
  }
}
