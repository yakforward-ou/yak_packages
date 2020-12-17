import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`TryRun`', () {
    test('WHEN `void Function()` throws THEN `Try` is `Failure`', () {
      final _tryRun = TryRun(() => throw 'ops');
      final _result = _tryRun();
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
      final _tryRun = TryRun(() {});
      final _result = _tryRun();
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
