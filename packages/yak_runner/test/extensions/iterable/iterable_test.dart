import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../mocks/all.dart';

void main() {
  const iterable = [1, 2, 3, 4];
  final mockExceptionHandler = MockHandleExceptionDelegate()
    ..stub.stub = (_) {};
  group('`IterableRunnerX`', () {
    test(
        'Given `Iterable<S>`'
        'WHEN `runner` fails even once '
        'THEN return Failure<Iterable<T>>', () {
      mockExceptionHandler.stub.reset;

      final runner = UnaryRunner<String, int>(
        (i) {
          if (i.isEven) {
            throw Exception();
          }
          return '$i';
        },
        exceptionHandler: mockExceptionHandler,
      );

      expect(
        runner.iterate(iterable),
        isA<Failure>(),
        reason: 'result should be a `Failure`',
      );

      expect(
        mockExceptionHandler.stub.count,
        1,
        reason: 'as runner should stop at first failure, '
            'handler should be called only once',
      );
    });
    test(
        'Given `Iterable<S>`'
        'WHEN `runner` does not fail '
        'THEN return Success<Iterable<T>>', () {
      mockExceptionHandler.stub.reset;

      final runner = UnaryRunner<String, int>(
        (i) => '$i',
        exceptionHandler: mockExceptionHandler,
      );

      final result = runner.iterate(iterable);

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
        mockExceptionHandler.stub.count,
        0,
        reason: 'handler should NOT be called',
      );
    });
  });
}
