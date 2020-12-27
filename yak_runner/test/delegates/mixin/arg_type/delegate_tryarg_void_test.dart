import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`TryRunTryArg` with `ArgReturnTypeMixin`', () {
    final _delegate = TryRunTryArg<int>((_) => throw '', () => throw '');
    test('WHEN `TryRunTryArg<int>` THEN `argType` is `int`', () {
      expect(_delegate.argType, int,
          reason: '`argType must be the ``Type` the function argument');
    });
  });
}
