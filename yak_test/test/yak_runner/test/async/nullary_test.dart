import 'package:yak_test/src/yak_runner/all.dart';

void main() {
  final _tester =
      YakRunnerAsyncTest<int>(description: '`YakRunnerTest<int>` sample test');
  _tester(4);
}
