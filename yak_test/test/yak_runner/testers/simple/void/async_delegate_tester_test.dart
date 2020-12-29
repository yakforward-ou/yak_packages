import 'package:yak_test/yak_test.dart';

void main() {
  const _tester = TryAnyRunAsyncTester<int>(
    description: '`TryAnyRunAsyncTester<int>` sample test',
  );
  _tester(4);
}
