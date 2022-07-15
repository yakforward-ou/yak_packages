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
        'GIVEN NullaryDelegate<T> delegate '
        'WHEN delegate.call '
        'THEN returns a T Function()', () {
      final delegate = _TestDelegate();
      expect(
        delegate.call,
        isA<int Function()>(),
        reason: 'delegat.call should be predictable',
      );
    });
  });
}
