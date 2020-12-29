import 'package:yak_test/src/yak_runner/testers/all.dart';

void main() {
  const _tester = TryRunArgAsyncTester<int>(
    description: '`TryRunArgAsyncTester<int>` sample test',
  );
  _tester(4);
}
