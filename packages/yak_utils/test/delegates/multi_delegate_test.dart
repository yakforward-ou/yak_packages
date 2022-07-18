import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

class Foo {}

class _TestDelegate2 implements MultiDelegate2<String, int, double> {
  const _TestDelegate2();
  @override
  String call(p0, p1) => '$p0$p1';
}

class _TestDelegate3 implements MultiDelegate3<String, int, double, num> {
  const _TestDelegate3();
  @override
  String call(p0, p1, p2) => '$p0$p1$p2';
}

class _TestDelegate4 implements MultiDelegate4<String, int, double, num, bool> {
  const _TestDelegate4();
  @override
  String call(p0, p1, p2, p3) => '$p0$p1$p2$p3';
}

class _TestDelegate5
    implements MultiDelegate5<String, int, double, num, bool, Foo> {
  const _TestDelegate5();
  @override
  String call(
    p0,
    p1,
    p2,
    p3,
    p4,
  ) =>
      '$p0$p1$p2$p3$p4';
}

void main() {
  group('MultiDelegate2', () {
    test(
        'GIVEN MultiDelegate2 '
        'WHEN delegate.call '
        'THEN returns a MultiArgFunction2', () {
      final delegate = _TestDelegate2();
      expect(
        delegate.call,
        isA<MultiArgFunction2<String, int, double>>(),
        reason: 'delegat.call should be predictable',
      );
    });
  });

  group('_TestDelegate3', () {
    test(
        'GIVEN _TestDelegate3 '
        'WHEN delegate.call '
        'THEN returns a MultiArgFunction3', () {
      final delegate = _TestDelegate3();
      expect(
        delegate.call,
        isA<MultiArgFunction3<String, int, double, num>>(),
        reason: 'delegat.call should be predictable',
      );
    });
  });

  group('MultiDelegate4', () {
    test(
        'GIVEN MultiDelegate4 '
        'WHEN delegate.call '
        'THEN returns a MultiArgFunction4', () {
      final delegate = _TestDelegate4();
      expect(
        delegate.call,
        isA<MultiArgFunction4<String, int, double, num, bool>>(),
        reason: 'delegat.call should be predictable',
      );
    });
  });

  group('MultiDelegate5', () {
    test(
        'GIVEN MultiDelegate5 '
        'WHEN delegate.call '
        'THEN returns a MultiArgFunction5', () {
      final delegate = _TestDelegate5();
      expect(
        delegate.call,
        isA<MultiArgFunction5<String, int, double, num, bool, Foo>>(),
        reason: 'delegat.call should be predictable',
      );
    });
  });
}
