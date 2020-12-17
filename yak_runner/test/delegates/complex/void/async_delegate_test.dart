import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:mockito/mockito.dart';
import '../../base/mock_future_delegate.dart';

void main() {
  group('`TryRunAsyncArg`', () {
    final _delegate = MockFutureDelegate<TryAny<String>>();
    final _tryRun = TryRunAsyncArg<String>((s) {}, _delegate);

    test('WHEN `arg`is `Failure` THEN `Try` is `Failure`', () async {
      when(_delegate.call())
          .thenReturn(TryAny.failure('', StackTrace.fromString('')));

      final _result = await _tryRun();
      expect(_result is Success, false);
      expect(_result is Failure, true);
      var _resultData;
      var _resultFail;
      _result.when(
          success: () async => _resultData = true,
          failure: (_, s) => _resultFail = s);
      expect(_resultData != null, false);
      expect(_resultFail != null, true);
    });

    test('WHEN `arg`is `Result` && fun() does not fail THEN `Try` is `Success`',
        () async {
      when(_delegate.call()).thenAnswer((_) async => TryAny.result('hello'));

      final _result = await _tryRun();
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
