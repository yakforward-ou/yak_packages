import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`TryAnyRunAsync`', () {
    test('WHEN `void Function()` throws THEN `Try` is `Failure`', () async {
      final _tryRun = TryAnyRunAsync(() async => throw 'ops');
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
      final _data = 1;
      final _tryRun = TryAnyRunAsync(() async => _data);
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
