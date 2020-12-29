import 'package:yak_test/yak_test.dart';

void main() {
  const _tester = TryRunArgTester<int>(
    description: '`TryRunArgTester<int>` sample test',
  );
  _tester(4);
}
