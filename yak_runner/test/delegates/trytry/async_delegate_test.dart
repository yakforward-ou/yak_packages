import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:mockito/mockito.dart';

import '../base/mock_error_handler.dart';
import '../base/mock_future_delegate.dart';

void main() {
  group('`TryRunArgAsync`', () {
    final _errorHandler = MockErrorHandler();
    final _delegateDelegate = MockFutureDelegate<Try>();
    final _funDelegate = MockFutureDelegate<void>();

    final _tryRun =
        TryRunTryAsync(_funDelegate, _delegateDelegate, _errorHandler);

    when(_errorHandler.call(any, any)).thenAnswer((_) {});

    test('WHEN `delegate`is `Failure` THEN `Try` is `Failure`', () async {
      clearInteractions(_errorHandler);
      clearInteractions(_delegateDelegate);
      clearInteractions(_funDelegate);

      when(_funDelegate.call()).thenAnswer((s) async {});
      when(_delegateDelegate.call())
          .thenAnswer((_) => Try.failure('', StackTrace.fromString('')));
      final _result = await _tryRun();

      expect(_result != null, true, reason: '`_result` must not be null');
      expect(_result is Success, false);
      expect(_result is Failure, true);

      var _resultData;
      var _resultFail;
      _result.when(
          success: () async => _resultData = true,
          failure: (_, s) => _resultFail = s);

      expect(_resultData != null, false);
      expect(_resultFail != null, true);

      verify(_delegateDelegate.call()).called(1);
      verifyNoMoreInteractions(_delegateDelegate);
      verifyZeroInteractions(_funDelegate);
      verifyZeroInteractions(_errorHandler);
    });

    test(
        'WHEN `delegate`is `Success` && fun() does not fail THEN `Try` is `Success`',
        () async {
      clearInteractions(_errorHandler);
      clearInteractions(_delegateDelegate);
      clearInteractions(_funDelegate);

      when(_funDelegate.call()).thenAnswer((s) async {});
      when(_delegateDelegate.call()).thenAnswer((_) => Try.success());
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

      verify(_delegateDelegate.call()).called(1);
      verifyNoMoreInteractions(_delegateDelegate);
      verify(_funDelegate.call()).called(1);
      verifyNoMoreInteractions(_funDelegate);
      verifyZeroInteractions(_errorHandler);
    });

    test(
        'WHEN `delegate`is `Succeess` but `fun()` throw THEN `Try` is `Failure`',
        () async {
      clearInteractions(_errorHandler);
      clearInteractions(_delegateDelegate);
      clearInteractions(_funDelegate);

      when(_delegateDelegate.call()).thenAnswer((_) async => Try.success());
      when(_funDelegate.call()).thenThrow('ops');

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

      verify(_delegateDelegate.call()).called(1);
      verifyNoMoreInteractions(_delegateDelegate);
      verify(_funDelegate.call()).called(1);
      verifyNoMoreInteractions(_funDelegate);
      verify(_errorHandler.call(any, any)).called(1);
      verifyNoMoreInteractions(_errorHandler);
    });
  });
}
