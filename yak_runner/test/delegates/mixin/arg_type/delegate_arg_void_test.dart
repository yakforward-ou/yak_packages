import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`TryAnyRunArg` with `ArgReturnTypeMixin`', () {
    final _delegate = TryRunArg<int>((_) => throw '');
    test('WHEN `TryAnyRunArg<int>` THEN `argType` is `int`', () {
      expect(_delegate.argType, int,
          reason: '`argType must be the ``Type` the function argument');
    });
  });
}
