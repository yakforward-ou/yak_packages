import 'package:yak_test/src/yak_runner/testers/all.dart';

void main() {
  const _tester =
      TryAnyRunTester<int>(description: '`TryAnyRunTester<int>` sample test');
  _tester(4);
}
