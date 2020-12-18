import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../base/mock_arg_delegate.dart';
import '../../base/mock_delegate.dart';

void main() {
  group('`TryRunArg`', () {
    final _data = 'hello';
    final _argDelegate = MockDelegate<String>();
    final _funDelegate = MockArgDelegate<void, String>();
    final _tryRun = TryRunArg<String>(_funDelegate);

    test('WHEN `args` throws THEN ***error is not cought***', () {
      when(_argDelegate.call()).thenThrow('ops');
      when(_funDelegate.call(_data)).thenAnswer((s) {});

      var _result;
      var _error;
      try {
        _result = _tryRun(_argDelegate());
      } catch (_, __) {
        _error = true;
      }

      expect(_result != null, false);
      expect(_error != null, true);
      verify(_argDelegate.call());
      verifyNoMoreInteractions(_argDelegate);
      verifyZeroInteractions(_funDelegate);
    });

    test('WHEN `void Function(S)` throws THEN `Try` is `Failure`', () {
      when(_argDelegate.call()).thenAnswer((realInvocation) => _data);
      when(_funDelegate.call(_data)).thenThrow('ops');

      final _result = _tryRun(_argDelegate());

      expect(_result != null, true, reason: '`_result` must not be null');
      expect(_result is Success, false);
      expect(_result is Failure, true);

      var _resultData;
      var _resultFail;
      _result.when(
          success: () => _resultData = true,
          failure: (_, s) => _resultFail = s);

      expect(_resultData != null, false);
      expect(_resultFail != null, true);

      verify(_argDelegate.call());
      verifyNoMoreInteractions(_argDelegate);
      verify(_funDelegate.call(_data));
      verifyNoMoreInteractions(_funDelegate);
    });

    test('WHEN `void Function(S)` does not fail `Try` is `Success`', () {
      when(_argDelegate.call()).thenAnswer((_) => _data);
      when(_funDelegate.call(_data)).thenAnswer((s) {});

      final _result = _tryRun(_argDelegate());

      expect(_result != null, true, reason: '`_result` must not be null');
      expect(_result is Success, true);
      expect(_result is Failure, false);

      var _resultData;
      var _resultFail;
      _result.when(
          success: () => _resultData = true,
          failure: (_, s) => _resultFail = s);

      expect(_resultData != null, true);
      expect(_resultFail != null, false);

      verify(_argDelegate.call());
      verifyNoMoreInteractions(_argDelegate);
      verify(_funDelegate.call(_data));
      verifyNoMoreInteractions(_funDelegate);
    });
  });
}
