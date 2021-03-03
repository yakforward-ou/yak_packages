import 'package:test/test.dart';
import 'bar.dart';

void main() {
  group('`Stub` with args test', () {
    final bar = BarStub<int, String, bool, double, Type>();
    const data = 1;
    test(
        'GIVEN `stub != null` '
        'WHEN Bar.bar is called '
        'THEN returns `result` regardless the arguments', () {
      bar.reset;
      bar.result = () => data;
      expect(
        bar.bar('1', true, .2, bar.runtimeType),
        data,
        reason: '`Foo.foo` should match `data`',
      );
    });
  });
}
