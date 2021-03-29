import 'package:test/test.dart';
import 'bar.dart';

void main() {
  group('`Stub` with args test', () {
    const data = 1;
    final bar = BarStub<int, String, bool, double, Type>()..stub = () => data;
    test(
        'GIVEN `stub != null` '
        'WHEN Bar.bar is called '
        'THEN returns `result` regardless the arguments', () {
      bar.reset;
      expect(
        bar.bar('1', true, .2, bar.runtimeType),
        data,
        reason: '`Foo.foo` should match `data`',
      );
    });
  });
}
