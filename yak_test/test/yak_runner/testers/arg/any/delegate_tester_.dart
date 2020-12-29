import 'package:yak_test/yak_test.dart';

void main() {
  const _tester = TryAnyRunArgTester<int, String>(
    description: '`TryAnyRunArgTester<int, String>` sample test',
  );
  _tester(4, 'hello');
}
