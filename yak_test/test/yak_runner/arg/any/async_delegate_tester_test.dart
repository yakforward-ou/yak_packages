import 'package:yak_test/yak_test.dart';

void main() {
  const _tester = TryAnyRunArgAsyncTester<int, String>(
    description: '`TryAnyRunArgAsyncTester<int, String>` sample test',
  );
  _tester(arg: 'hello', result: 4);
}
