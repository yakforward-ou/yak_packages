import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('RunnerFunction typedefs TEST', () {
    test('WHEN Runner<T>' 'THEN is a RunnerFunction<T>', () {
      expect(
        Runner(() => 'hello'),
        isA<RunnerFunction<String>>(),
        reason: 'Runner should be a FutuRunnerFunction',
      );
    });
    test('WHEN RunnerAsync<T>' 'THEN is a RunnerAsyncFunction<T>', () {
      expect(
        RunnerAsync(() async => 'hello'),
        isA<RunnerAsyncFunction<String>>(),
        reason: 'Runner should be a FutuRunnerFunction',
      );
    });
    test('WHEN UnaryRunner<T,S>' 'THEN is a UnaryRunnerFunction<T,S>', () {
      expect(
        UnaryRunner<String, int>((i) => 'hello'),
        isA<UnaryRunnerFunction<String, int>>(),
        reason: 'Runner should be a FutuRunnerFunction',
      );
    });
    test('WHEN UnaryRunnerAsync<T,S>' 'THEN is a UnaryRunnerAsyncFunction<T,S>',
        () {
      expect(
        UnaryRunnerAsync<String, int>((i) async => 'hello'),
        isA<UnaryRunnerAsyncFunction<String, int>>(),
        reason: 'Runner should be a FutuRunnerFunction',
      );
    });
  });
}
