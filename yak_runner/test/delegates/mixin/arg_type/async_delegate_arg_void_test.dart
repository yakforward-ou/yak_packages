import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`TryRunArgAsync` with `ArgReturnTypeMixin`', () {
    final _delegate = TryRunArgAsync<int>(
      (_) => throw '',
    );
    test('WHEN `TryRunArgAsync<int>` THEN `argType` is `int`', () {
      expect(_delegate.argType, int,
          reason: '`argType must be the ``Type` the function argument');
    });
  });
}
