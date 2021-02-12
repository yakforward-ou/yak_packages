import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  group('`YakRunnerArg`', () {
    final _data = 1;
    final _res = '$_data';
    final _errorHandler = MockErrorHandler();
    final _delegate = MockUnaryDelegate<String, int>();
    final _runner = YakRunnerArg<String, int>(_delegate, _errorHandler);
    when(_errorHandler(any, any)).thenAnswer(null);

    test('WHEN `void Function(T)` throws THEN `Result` is `Failure`', () {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenThrow(Exception());
      final _result = _runner(_data);

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
        _result,
        isA<Failure>(),
        reason: '`_result` should be `Failure`',
      );
      verify(_delegate(_data)).called(1);
      verify(_errorHandler(any, any)).called(1);
    });

    test('WHEN `void Function()` does not fail `Result` is `Success`', () {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenReturn(_res);

      final _result = _runner(_data);

      expect(
        _result,
        isNotNull,
        reason: '`_result` must not be null',
      );
      expect(
        _result,
        isA<Success>(),
        reason: '`_result` should be `Success`',
      );
      expect(
        _result,
        isNot(Failure),
        reason: '`_result` should not be `Failure`',
      );

      verify(_delegate(_data)).called(1);
      verifyNever(_errorHandler(any, any));
    });
  });
}
