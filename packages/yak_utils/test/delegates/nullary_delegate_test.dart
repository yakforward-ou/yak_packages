import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

class _TestDelegate implements NullaryDelegate<int> {
  const _TestDelegate();
  @override
  int call() => 0;
}

void main() {
  group('NullaryDelegate', () {
    test(
        'GIVEN NullaryDelegate '
        'WHEN delegate.call '
        'THEN returns a Nullary', () {
      final delegate = _TestDelegate();
      expect(
        delegate.call,
        isA<Nullary<int>>(),
        reason: 'delegat.call should be predictable',
      );
    });
  });
}
