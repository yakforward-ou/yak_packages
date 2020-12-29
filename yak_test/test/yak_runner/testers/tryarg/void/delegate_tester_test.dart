import 'package:yak_test/yak_test.dart';

void main() {
  const _tester = TryRunTryArgTester<String>(
    description: '`TryRunTryArgTester<String>` sample test',
  );
  _tester('hello');
}
