import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  group('`YakRunner`', () {
    final _data = 1;
    final _errorHandler = MockErrorHandler();
    final _delegate = MockDelegate<int>();
    final _runner = YakRunner(_delegate, _errorHandler);
    test('WHEN `void Function()` throws THEN `Result` is `Failure`', () {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate).calls('call').thenThrow('throwable');
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

      /// this should be in the mixin
      // var _success;
      // var _failure;
      // _result.when(
      //   success: (data) => _success = data,
      //   failure: (_, s) => _failure = s,
      // );

      // expect(_success != null, false);
      // expect(_failure != null, true);

      // verify(_delegate).calls('call').times(equals(1));
      // verify(_errorHandler).calls('call').times(equals(1));
    });

    test('WHEN `void Function()` does not fail `Result` is `Success`', () {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate).calls('call').thenReturn(_data);
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

      // var _success;
      // var _failure;
      // _result.when(
      //   success: (data) => _success = data,
      //   failure: (_, s) => _failure = s,
      // );

      // expect(_success != null, true);
      // expect(_success, _data);
      // expect(_failure != null, false);

      // verify(_delegate).calls('call').times(equals(1));
      // verify(_errorHandler).calls('call').times(equals(0));
    });
  });
}
