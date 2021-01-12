import 'package:yak_test/src/yak_runner/all.dart';

void main() {
  final _tester = YakRunnerArgAsyncTest<int, String>(
      description: '`YakRunnerTest<int>` sample test');
  _tester(0, '0');
}
