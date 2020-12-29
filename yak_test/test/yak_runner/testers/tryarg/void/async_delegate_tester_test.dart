import 'package:yak_test/src/yak_runner/testers/all.dart';

void main() {
  const _tester = TryRunTryArgAsyncTester<String>(
    description: '`TryRunTryArgTester<String>` sample test',
  );
  _tester('hello');
}
