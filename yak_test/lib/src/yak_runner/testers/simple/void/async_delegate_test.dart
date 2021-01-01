import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../../mock/mock_error_handler.dart';
import '../../../mock/mock_future_delegate.dart';

/// a class that runs test for `TryRunAsync`

class TryRunAsyncTester implements VoidTestDelegate {
  const TryRunAsyncTester({@required this.description});
  final String description;

  void call() {
    group(description, () {
      final _errorHandler = MockErrorHandler();
      final _delegate = MockFutureDelegate<void>();
      final _tryRun = TryRunAsync(_delegate, _errorHandler);

      when(_errorHandler.call(any, any)).thenAnswer((_) {});

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
            success: () => _resultData = true,
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

        when(_delegate.call()).thenAnswer((_) async {});
        final _result = await _tryRun();

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

        verify(_delegate.call()).called(1);
        verifyNoMoreInteractions(_delegate);
        verifyZeroInteractions(_errorHandler);
      });
    });
  }
}
