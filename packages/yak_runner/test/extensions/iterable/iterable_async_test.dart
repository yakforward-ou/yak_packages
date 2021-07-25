import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  const iterable = [1, 2, 3, 4];
  final reportStub = unaryStub<void, ErrorReport>()..stub = (_) {};
  group('`IterableRunnerX`', () {
    test(
        'Given `Iterable<S>`'
        'WHEN `runner` fails even once '
        'THEN return Futire<Failure<Iterable<T>>>', () async {
      reportStub.reset;

      final runner = UnaryRunnerAsync<String, int>(
        (i) async {
          final j = await i;
          if (j.isEven) {
            throw Exception();
          }
          return '$j';
        },
        errorReport: reportStub.wrap,
      );

      expect(
        await runner.iterate(iterable),
        isA<Failure>(),
        reason: 'result should be a `Failure`',
      );

      expect(
        reportStub.count,
        1,
        reason: 'as runner should stop at first failure, '
            'handler should be called only once',
      );
    });
    test(
        'Given `Iterable<S>`'
        'WHEN `runner` does not fail '
        'THEN return Future<Success<Iterable<T>>>', () async {
      reportStub..reset;

      final runner = UnaryRunnerAsync<String, int>(
        (i) async => '${await i}',
        errorReport: reportStub.wrap,
      );

      final result = await runner.iterate(iterable);
      expect(
        result,
        isA<Success>(),
        reason: 'result should be a `Success`',
      );

      final success = result as Success<Iterable<String>>;

      expect(
        success.data.length == iterable.length,
        true,
        reason: 'succcess.data and iterable have the same lenght',
      );

      expect(
        reportStub.count,
        0,
        reason: 'handler should NOT be called',
      );
    });
  });
}
