import 'package:yak_test/yak_test.dart';

void main() {
  const _tester = TryAnyRunTester<int>(
    description: '`TryAnyRunTester<int>` sample test',
  );
  _tester(4);
}
