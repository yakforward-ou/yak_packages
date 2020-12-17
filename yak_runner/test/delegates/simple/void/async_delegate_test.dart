import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../base/mock_future_delegate.dart';

void main() {
  group('`TryRunAsync`', () {
    final _delegate = MockFutureDelegate<void>();
    final _tryRun = TryRunAsync(_delegate);
    test('WHEN `void Function()` throws THEN `Try` is `Failure`', () async {
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
    });

    test('WHEN `void Function()` does not fail `Try` is `Success`', () async {
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
    });
  });
}
