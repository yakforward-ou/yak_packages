import 'package:yak_test/yak_test.dart';

void main() {
  const _tester = TryRunArgAsyncTester<int>(
    description: '`TryRunArgAsyncTester<int>` sample test',
    arg: 4,
  );
  _tester();
}
