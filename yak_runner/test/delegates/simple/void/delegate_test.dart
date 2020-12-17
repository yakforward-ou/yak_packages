import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../base/mock_delegate.dart';

void main() {
  group('`TryRun`', () {
    final _delegate = MockDelegate<void>();
    final _tryRun = TryRun(_delegate);
    test('WHEN `void Function()` throws THEN `Try` is `Failure`', () {
      when(_delegate.call()).thenThrow('ops');
      final _result = _tryRun();

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
    });

    test('WHEN `void Function()` does not fail `Try` is `Success`', () {
      when(_delegate.call()).thenAnswer((_) {});

      final _result = _tryRun();

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
    });
  });
}
