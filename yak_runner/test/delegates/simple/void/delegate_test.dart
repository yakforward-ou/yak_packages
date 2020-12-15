import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`TryRun`', () {
    test('WHEN `void Function()` throws THEN `Try` is Failure', () async {
      final _tryRun = TryRun(() => throw 'ops');
      expect(_tryRun is Success, false);
      expect(_tryRun is Failure, true);
    });
  });
}
