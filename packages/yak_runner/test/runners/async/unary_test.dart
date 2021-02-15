import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  group('`YakRunnerArgAsync`', () {
    final _data = 1;
    final _res = '$_data';
    final _errorHandler = MockErrorHandler();
    final _delegate = MockUnaryDelegate<Future<String>, FutureOr<int>>();
    final _runner = YakRunnerArgAsync<String, int>(_delegate, _errorHandler);
    when(_errorHandler(any, any)).thenAnswer(null);

    test('WHEN `void Function(T)` throws THEN `Result` is `Failure`', () async {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenThrow(Exception());
      final _result = await _runner(_data);

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

    test('WHEN `void Function()` does not fail `Result` is `Success`',
        () async {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenAnswer((_) async => _res);

      final _result = await _runner(_data);

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

    test(
      'WHEN `fun` is `null` THEN `assert` should `throwsAssertionError`',
      () => expect(
        () => YakRunnerArgAsync(null),
        throwsA(isA<AssertionError>()),
        reason: '`fun == null` should throw `AssertionError`',
      ),
    );

    test(
        'WHEN `call` -> `arg` is `null` '
        'THEN `assert` should `throwsAssertionError`', () {
      final runner = YakRunnerArgAsync<String, int>((i) async => 'i');
      expect(
        () => runner(null),
        throwsA(isA<AssertionError>()),
        reason: '`arg == null` should throw `AssertionError`',
      );
    });
  });
}
