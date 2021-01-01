import 'package:yak_test/src/yak_runner/testers/all.dart';

void main() {
  const _tester = TryRunArgTester<int>(
    description: '`TryRunArgTester<int>` sample test',
  );
  _tester(4);
}
