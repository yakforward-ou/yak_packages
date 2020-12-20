import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../base/mock_delegate.dart';
import '../../base/mock_error_handler.dart';

void main() {
  group('`TryAnyRun`', () {
    final _data = 1;
    final _errorHandler = MockErrorHandler();
    final _delegate = MockDelegate<int>();
    final _tryRun = TryAnyRun(_delegate, _errorHandler);
    test('WHEN `void Function()` throws THEN `Try` is `Failure`', () {
      clearInteractions(_errorHandler);
      clearInteractions(_delegate);

      when(_delegate.call()).thenThrow('ops');
      final _result = _tryRun();

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

    test('WHEN `void Function()` does not fail `Try` is `Success`', () {
      clearInteractions(_errorHandler);
      clearInteractions(_delegate);

      when(_delegate.call()).thenAnswer((_) => _data);
      final _result = _tryRun();

      expect(_result != null, true, reason: '`_result` must not be null');
      expect(_result is Success, true);
      expect(_result is Failure, false);

      var _resultData;
      var _resultFail;
      _result.when(
          result: (data) => _resultData = data,
          failure: (_, s) => _resultFail = s);

      expect(_resultData != null, true);
      expect(_resultData, _data);
      expect(_resultFail != null, false);

      verify(_delegate.call()).called(1);
      verifyNoMoreInteractions(_delegate);
      verifyZeroInteractions(_errorHandler);
    });
  });
}
