import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  final _data = 1;
  final _res = '$_data';
  final _errorHandler = MockErrorHandler();
  when(_errorHandler(any, any)).thenAnswer(null);

  group('`onResult` MIXIN', () {
    final _firstDelegate = MockDelegate<int>();

    final _secondDelegate = MockUnaryDelegate<String, int>();
    final _firstRunner = YakRunner(_firstDelegate, _errorHandler);

    final _secondRunner =
        YakRunnerArg<String, int>(_secondDelegate, _errorHandler);

    test('WHEN `Delegate<S>` fails THEN  `onResult() return Failure<T>', () {
      reset(_errorHandler);
      reset(_firstDelegate);
      reset(_secondDelegate);

      when(_firstDelegate()).thenThrow('throwable');
      when(_secondDelegate(_data)).thenReturn(_res);

      final _result = _firstRunner().onResult<String>(_secondRunner);

      expect(
        _result,
        isNotNull,
        reason: '`_result` must not be null',
      );
      expect(
        _result,
        isNot(Success),
        reason: '`_result` should not be `Success`',
      );
      expect(
        _result is Failure<int>,
        false,
        reason: '`_result`should not be `Failure<S>`',
      );
      expect(
        _result,
        isA<Failure<String>>(),
        reason: '`_result` should be `Failure<T>`',
      );

      verify(_firstDelegate()).called(1);
      verify(_errorHandler(any, any)).called(1);
      verifyZeroInteractions(_secondDelegate);
    });

    test('WHEN `ArgDelegate<T,S>` fail THEN  `onResult() return Failure<T>',
        () {
      reset(_errorHandler);
      reset(_firstDelegate);
      reset(_secondDelegate);

      when(_firstDelegate()).thenReturn(_data);
      when(_secondDelegate(_data)).thenThrow('throwable');

      final _result = _firstRunner().onResult<String>(_secondRunner);

      expect(
        _result,
        isNotNull,
        reason: '`_result` must not be null',
      );
      expect(
        _result,
        isNot(Success),
        reason: '`_result` should not be `Success`',
      );
      expect(
        _result is Failure<int>,
        false,
        reason: '`_result`should not be `Failure<S>`',
      );
      expect(
        _result,
        isA<Failure<String>>(),
        reason: '`_result` should be `Failure<T>`',
      );

      verify(_firstDelegate()).called(1);
      verify(_secondDelegate(_data)).called(1);
      verify(_errorHandler(any, any)).called(1);
    });
  });
}
