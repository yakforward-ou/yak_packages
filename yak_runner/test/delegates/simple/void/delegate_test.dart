import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`TryRun`', () {
    test('WHEN `void Function()` throws THEN `Try` is `Failure`', () async {
      final _tryRun = TryRun(() => throw 'ops');
      final _result = _tryRun();
      expect(_result is Success, false);
      expect(_result is Failure, true);
    });

    test('WHEN `void Function()` does not fail `Try` is `Success`', () async {
      final _tryRun = TryRun(() {});
      final _result = _tryRun();
      expect(_result is Success, true);
      expect(_result is Failure, false);
    });
  });
}
