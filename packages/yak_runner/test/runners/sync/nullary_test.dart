import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  group('`YakRunner`', () {
    final _data = 1;
    final _errorHandler = MockErrorHandler();
    final _delegate = MockDelegate<int>();
    final _runner = YakRunner(_delegate, _errorHandler);
    when(_errorHandler(any, any)).thenAnswer(null);

    test('WHEN `void Function()` throws THEN `Result` is `Failure`', () {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate()).thenThrow(Exception());
      final _result = _runner();

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

      verify(_delegate()).called(1);
      verify(_errorHandler(any, any)).called(1);
    });

    test('WHEN `void Function()` does not fail `Result` is `Success`', () {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate()).thenReturn(_data);
      final _result = _runner();

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

      verify(_delegate()).called(1);
      verifyNever(_errorHandler(any, any));
    });
  });
}
