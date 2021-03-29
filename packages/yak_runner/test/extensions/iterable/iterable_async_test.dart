import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../mocks/all.dart';

void main() {
  const iterable = [1, 2, 3, 4];
  final handler = HandleExceptionDelegateStub()..stub = () {};
  group('`IterableRunnerX`', () {
    test(
        'Given `Iterable<S>`'
        'WHEN `runner` fails even once '
        'THEN return Futire<Failure<Iterable<T>>>', () async {
      handler.reset;

      final runner = UnaryRunnerAsync<String, int>(
        (i) async {
          final j = await i;
          if (j.isEven) {
            throw Exception();
          }
          return '$j';
        },
        exceptionHandler: handler,
      );

      expect(
        await iterable.iterateAsync(runner),
        isA<Failure>(),
        reason: 'result should be a `Failure`',
      );

      expect(
        handler.callCount,
        1,
        reason: 'as runner should stop at first failure, '
            'handler should be called only once',
      );
    });
    test(
        'Given `Iterable<S>`'
        'WHEN `runner` does not fail '
        'THEN return Future<Success<Iterable<T>>>', () async {
      handler.reset;

      final runner = UnaryRunnerAsync<String, int>(
        (i) async => '${await i}',
        exceptionHandler: handler,
      );

      final result = await iterable.iterateAsync<String>(runner);

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
        handler.callCount,
        0,
        reason: 'handler should NOT be called',
      );
    });
  });
}
