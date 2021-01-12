import 'package:yak_test/src/yak_runner/all.dart';

void main() {
  final _tester = YakRunnerArgTest<int, String>(
      description: '`YakRunnerTest<int>` sample test');
  _tester(0, '0');
}
