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
        'GIVEN UnaryDelegate<T,S> delegate '
        'WHEN delegate.call '
        'THEN returns a T Function(S)', () {
      final delegate = _TestDelegate();
      expect(
        delegate.call,
        isA<String Function(int)>(),
        reason: 'delegat.call should be predictable',
      );
    });
  });
}
