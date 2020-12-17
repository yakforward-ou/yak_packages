import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../base/mock_future_delegate.dart';

void main() {
  group('`TryAnyRunAsync`', () {
    final _data = 1;
    final _delegate = MockFutureDelegate<int>();
    final _tryRun = TryAnyRunAsync(_delegate);
    test('WHEN `void Function()` throws THEN `Try` is `Failure`', () async {
      when(_delegate.call()).thenThrow('ops');
      final _result = await _tryRun();
      expect(_result is Success, false);
      expect(_result is Failure, true);
      var _resultData;
      var _resultFail;
      _result.when(
          result: (data) => _resultData = data,
          failure: (_, s) => _resultFail = s);
      expect(_resultData != null, false);
      expect(_resultFail != null, true);
    });

    test('WHEN `void Function()` does not fail `Try` is `Success`', () async {
      when(_delegate.call()).thenAnswer((_) async => _data);
      final _result = await _tryRun();
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
    });
  });
}
