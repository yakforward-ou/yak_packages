import 'package:yak_test/yak_test.dart';

void main() {
  const _tester = TryAnyRunTryArgAsyncTester<int, String>(
    description: '`TryAnyRunTryArgAsyncTester<int, String>` sample test',
  );
  _tester(4, 'hello');
}
