import 'package:yak_test/src/yak_runner/testers/all.dart';

void main() {
  const _tester = TryAnyRunArgAsyncTester<int, String>(
    description: '`TryAnyRunArgAsyncTester<int, String>` sample test',
  );
  _tester(4, 'hello');
}
