import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

final unaryRunner = UnaryRunner<String, int>((i) => '$i');
final unaryTest = unaryRunner.buildTest(
  unaryRunner.buildTestFactory('unary test'),
);

final nullaryRunner = Runner(() => 0);
final nullaryTest = nullaryRunner.buildTest(
  nullaryRunner.buildTestFactory('nullary test'),
);

final unaryAsyncRunner = UnaryRunnerAsync<String, int>((i) async => '$i');
final unaryAsyncTest = unaryAsyncRunner.buildTest(
  unaryAsyncRunner.buildTestFactory('async unary test'),
);

final nullaryAsyncRunner = RunnerAsync(() async => 0);
final nullaryAsyncTest = nullaryAsyncRunner.buildTest(
  nullaryAsyncRunner.buildTestFactory('async nullary test'),
);

void main() {
  unaryTest('hello', 0);
  nullaryTest(0);
  unaryAsyncTest('hello', 0);
  nullaryAsyncTest(0);
}
