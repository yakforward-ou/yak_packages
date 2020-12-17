import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:mockito/mockito.dart';
import '../../base/mock_delegate.dart';

void main() {
  group('`TryAnyRunArg`', () {
    final _data = 'hello';
    final _delegate = MockDelegate<TryAny<String>>();
    final _tryRun = TryAnyRunArg<int, String>((s) => s.length, _delegate);

    test('WHEN `arg`is `Failure` THEN `Try` is `Failure`', () {
      when(_delegate.call())
          .thenReturn(TryAny.failure('', StackTrace.fromString('')));

      final _result = _tryRun();

      expect(_result != null, true, reason: '`_result` must not be null');
      expect(_result is Success, false);
      expect(_result is Failure, true);

      var _resultData;
      var _resultFail;
      _result.when(
        result: (r) => _resultData = r,
        failure: (_, s) => _resultFail = s,
      );

      expect(_resultData != null, false);
      expect(_resultFail != null, true);
    });

    test('WHEN `arg`is `Result` && fun() does not fail THEN `Try` is `Success`',
        () {
      when(_delegate.call()).thenAnswer((_) => TryAny.result(_data));

      final _result = _tryRun();

      expect(_result != null, true, reason: '`_result` must not be null');
      expect(_result is Success, true);
      expect(_result is Failure, false);

      var _resultData;
      var _resultFail;
      _result.when(
          result: (r) => _resultData = r, failure: (_, s) => _resultFail = s);

      expect(_resultData != null, true);
      expect(_resultData, _data.length);
      expect(_resultFail != null, false);
    });
  });
}
