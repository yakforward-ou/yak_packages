import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  group('`YakRunner`', () {
    final _data = 1;
    final _errorHandler = MockErrorHandler();
    final _delegate = MockDelegate<int>();
    final _runner = YakRunner<int>(_delegate, _errorHandler);
    test('WHEN `void Function()` throws THEN `Result` is `Failure`', () {
      clearInteractions(_errorHandler);
      clearInteractions(_delegate);

      when(_delegate.call()).thenThrow('ops');
      final _result = _runner();

      expect(
        _result != null,
        true,
        reason: '`_result` must not be null',
      );
      expect(
        _result is Success,
        false,
        reason: "`_result` shouldn't be `Success`",
      );
      expect(
        _result is Failure,
        true,
        reason: "`_result` should be `Failure`",
      );

      // var _success;
      // var _failure;
      // _result.when(
      //     success: (data) => _success = data,
      //     failure: (_, s) => _failure = s);

      // expect(_success != null, false);
      // expect(_failure != null, true);

      // verify(_delegate.call()).called(1);
      // verifyNoMoreInteractions(_delegate);
      // verify(_errorHandler.call(any, any)).called(1);
      // verifyNoMoreInteractions(_errorHandler);
    });

    test('WHEN `void Function()` does not fail THEN `Result` is `Success`', () {
      clearInteractions(_errorHandler);
      clearInteractions(_delegate);

      when(_delegate.call()).thenAnswer((_) => _data);
      final _result = _runner();

      expect(
        _result != null,
        true,
        reason: '`_result` must not be null',
      );
      expect(
        _result is Success,
        true,
        reason: "`_result` should be `Success`",
      );
      expect(
        _result is Failure,
        false,
        reason: "`_result` shouldn't  be `Failure`",
      );

      // var _success;
      // var _failure;
      // _result.when(
      //     result: (data) => _success = data, failure: (_, s) => _failure = s);

      // expect(_success != null, true);
      // expect(_success, _data);
      // expect(_failure != null, false);

      // verify(_delegate.call()).called(1);
      // verifyNoMoreInteractions(_delegate);
      // verifyZeroInteractions(_errorHandler);
    });
  });
}
