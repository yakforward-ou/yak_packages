import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:mockito/mockito.dart';
import '../../base/mock_arg_delegate.dart';
import '../../base/mock_delegate.dart';

void main() {
  group('`TryAnyRunTryArg`', () {
    final _data = 'hello';
    final _argDelegate = MockDelegate<TryAny<String>>();
    final _funDelegate = MockArgDelegate<int, String>();
    final _tryRun = TryAnyRunTryArg<int, String>(_funDelegate, _argDelegate);

    test('WHEN `arg`is `Failure` THEN `Try` is `Failure`', () {
      when(_funDelegate.call(_data)).thenAnswer((s) => _data.length);
      when(_argDelegate.call())
          .thenAnswer((_) => TryAny.failure('', StackTrace.fromString('')));

      final _result = _tryRun();

      expect(_result != null, true, reason: '`_result` must not be null');
      expect(_result is Success, false);
      expect(_result is Failure, true);

      var _resultData;
      var _resultFail;
      _result.when(
        result: (r) => _resultData = r,
        failure: (_, s) => _resultFail = s,
      );

      expect(_resultData != null, false);
      expect(_resultFail != null, true);

      verify(_argDelegate.call());
      verifyNoMoreInteractions(_argDelegate);
      verifyZeroInteractions(_funDelegate);
    });

    test('WHEN `arg`is `Result` && fun() does not fail THEN `Try` is `Success`',
        () {
      when(_funDelegate.call(_data)).thenAnswer((s) => _data.length);
      when(_argDelegate.call()).thenAnswer((_) => TryAny.result(_data));

      final _result = _tryRun();

      expect(_result != null, true, reason: '`_result` must not be null');
      expect(_result is Success, true);
      expect(_result is Failure, false);

      var _resultData;
      var _resultFail;
      _result.when(
          result: (r) => _resultData = r, failure: (_, s) => _resultFail = s);

      expect(_resultData != null, true);
      expect(_resultData, _data.length);
      expect(_resultFail != null, false);

      verify(_argDelegate.call());
      verifyNoMoreInteractions(_argDelegate);
      verify(_funDelegate.call(_data));
      verifyNoMoreInteractions(_funDelegate);
    });

    test('WHEN `arg`is `Result` but `fun()` throw THEN `Try` is `Failure`', () {
      when(_argDelegate.call()).thenAnswer((_) => TryAny.result(_data));
      when(_funDelegate.call(_data)).thenThrow('ops');

      final _result = _tryRun();

      expect(_result != null, true, reason: '`_result` must not be null');
      expect(_result is Success, false);
      expect(_result is Failure, true);

      var _resultData;
      var _resultFail;
      _result.when(
          result: (r) => _resultData = r, failure: (_, s) => _resultFail = s);

      expect(_resultData != null, false);
      expect(_resultFail != null, true);

      verify(_argDelegate.call());
      verifyNoMoreInteractions(_argDelegate);
      verify(_funDelegate.call(_data));
      verifyNoMoreInteractions(_funDelegate);
    });
  });
}
