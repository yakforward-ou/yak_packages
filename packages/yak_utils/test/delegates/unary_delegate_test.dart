import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

class _TestDelegate implements UnaryDelegate<String, int> {
  const _TestDelegate();
  @override
  String call(int p0) => '$p0';
}

void main() {
  group('UnaryDelegate', () {
    test(
        'GIVEN UnaryDelegate '
        'WHEN delegate.call '
        'THEN returns a Unary', () {
      final delegate = _TestDelegate();
      expect(
        delegate.call,
        isA<Unary<String, int>>(),
        reason: 'delegat.call should be predictable',
      );
    });
  });
}
