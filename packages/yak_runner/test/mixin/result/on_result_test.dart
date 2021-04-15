import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../mocks/all.dart';

void main() {
  const data = 1;
  final mockExceptionHandler = MockHandleExceptionDelegate()
    ..stub.stub = (_) {};
  group('`onResult` MIXIN', () {
    final firstDelegate = nullaryStub<int>();

    final secondDelegate = unaryStub<String, int>();
    final firstRunner = Runner<int>(
      firstDelegate.wrap,
      exceptionHandler: mockExceptionHandler,
    );

    final secondRunner = UnaryRunner<String, int>(
      secondDelegate.wrap,
      exceptionHandler: mockExceptionHandler,
    );
    test('WHEN `Delegate<S>` fails THEN  `onResult() return Failure<T>', () {
      mockExceptionHandler.stub.reset;
      firstDelegate.reset;
      secondDelegate.reset;

      firstDelegate.stub = () => throw Exception();
      secondDelegate.stub = (i) => '$i';

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
        firstDelegate.count,
        1,
        reason: '`firstDelegate` should be called once',
      );
      expect(
        secondDelegate.count,
        0,
        reason: '`secondDelegate` should NOT be called',
      );
      expect(
        mockExceptionHandler.stub.count,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });

    test('WHEN `ArgDelegate<T,S>` fail THEN  `onResult() return Failure<T>',
        () {
      mockExceptionHandler.stub.reset;
      firstDelegate.reset;
      secondDelegate.reset;

      firstDelegate.stub = () => data;
      secondDelegate.stub = (i) => throw Exception();

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
        firstDelegate.count,
        1,
        reason: '`firstDelegate` should be called once',
      );
      expect(
        secondDelegate.count,
        1,
        reason: '`secondDelegate` should NOT be called',
      );
      expect(
        mockExceptionHandler.stub.count,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });
  });
}
