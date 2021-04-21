import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('RunnerBuilder typedefs TEST', () {
    test('WHEN (S) =>  Runner<T>' 'THEN is a RunnerBuilder<T,S>', () {
      final builder =  (int i) =>Runner(() => 'hello');
      expect(
       ,
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
