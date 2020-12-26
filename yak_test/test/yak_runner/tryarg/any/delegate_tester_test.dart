import 'package:yak_test/yak_test.dart';

void main() {
  const _tester = TryAnyRunTryArgTester<int, String>(
    description: '`TryAnyRunTryArgTester<int, String>` sample test',
    arg: 'hello',
    result: 4,
  );
  _tester();
}
