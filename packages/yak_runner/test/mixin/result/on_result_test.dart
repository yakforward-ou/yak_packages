import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  const data = 1;
  const res = '$data';

  group('`onResult` MIXIN', () {
    final exceptionHandler = HandleExceptionDelegateStub();
    final firstDelegate = MockDelegate<int>();

    final secondDelegate = MockUnaryDelegate<String, int>();
    final firstRunner = YakRunner<int>(
      firstDelegate,
      exceptionHandler: exceptionHandler,
    );

    final secondRunner = YakRunnerArg<String, int>(
      secondDelegate,
      exceptionHandler: exceptionHandler,
    );
    test('WHEN `Delegate<S>` fails THEN  `onResult() return Failure<T>', () {
      exceptionHandler.reset;
      firstDelegate.reset;
      secondDelegate.reset;

      firstDelegate.stub = () => throw Exception();
      secondDelegate.stub = () => res;
      exceptionHandler.stub = () {};

      final result = firstRunner().onResult<String>(secondRunner);

      expect(
        result,
        isNotNull,
        reason: '`result` must not be null',
      );
      expect(
        result,
        isNot(Success),
        reason: '`result` should not be `Success`',
      );
      expect(
        result is Failure<int>,
        false,
        reason: '`result`should not be `Failure<S>`',
      );
      expect(
        result,
        isA<Failure<String>>(),
        reason: '`result` should be `Failure<T>`',
      );
      expect(
        firstDelegate.callCount,
        1,
        reason: '`firstDelegate` should be called once',
      );
      expect(
        secondDelegate.callCount,
        0,
        reason: '`secondDelegate` should NOT be called',
      );
      expect(
        exceptionHandler.callCount,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });

    test('WHEN `ArgDelegate<T,S>` fail THEN  `onResult() return Failure<T>',
        () {
      exceptionHandler.reset;
      firstDelegate.reset;
      secondDelegate.reset;

      firstDelegate.stub = () => data;
      secondDelegate.stub = () => throw Exception();
      exceptionHandler.stub = () {};

      final result = firstRunner().onResult<String>(secondRunner);

      expect(
        result,
        isNotNull,
        reason: '`result` must not be null',
      );
      expect(
        result,
        isNot(Success),
        reason: '`result` should not be `Success`',
      );
      expect(
        result is Failure<int>,
        false,
        reason: '`result`should not be `Failure<S>`',
      );
      expect(
        result,
        isA<Failure<String>>(),
        reason: '`result` should be `Failure<T>`',
      );
      expect(
        firstDelegate.callCount,
        1,
        reason: '`firstDelegate` should be called once',
      );
      expect(
        secondDelegate.callCount,
        1,
        reason: '`secondDelegate` should NOT be called',
      );
      expect(
        exceptionHandler.callCount,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });
  });
}
