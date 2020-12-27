import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`TryRunTryArgAsync` with `ArgReturnTypeMixin`', () {
    final _delegate = TryRunTryArgAsync<int>((_) => throw '', () => throw '');
    test('WHEN `TryRunTryArgAsync<int>` THEN `argType` is `int`', () {
      expect(_delegate.argType, int,
          reason: '`argType must be the ``Type` the function argument');
    });
  });
}
