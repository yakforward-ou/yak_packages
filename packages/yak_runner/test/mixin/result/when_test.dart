import 'dart:async';

import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  const data = 1;
  const res = '$data';

  group('`when` MIXIN on`YakRunnerArg`', () {
    final exceptionHandler = HandleExceptionDelegateStub();
    final delegate = MockUnaryDelegate<String, int>();
    final runner = YakRunnerArg<String, int>(
      delegate,
      exceptionHandler: exceptionHandler,
    );

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () {
      delegate.reset;
      exceptionHandler.reset;

      delegate.stub = () => throw Exception();
      exceptionHandler.stub = () {};

      var _success;
      var _failure;

      runner(data).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');
      expect(
        delegate.callCount,
        1,
        reason: '`delegate` houl be called once',
      );
      expect(
        exceptionHandler.callCount,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () {
      delegate.reset;
      exceptionHandler.reset;

      delegate.stub = () => res;
      exceptionHandler.stub = () {};

      var _success;
      var _failure;

      runner(data).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');
      expect(
        delegate.callCount,
        1,
        reason: '`delegate` shoul be called once',
      );
      expect(
        exceptionHandler.callCount,
        0,
        reason: '`exceptionHandler` should NOT be called ',
      );
    });
  });

  group('`when` MIXIN on `YakRunner`', () {
    final delegate = MockDelegate<int>();
    final exceptionHandler = HandleExceptionDelegateStub();
    final runner = YakRunner(
      delegate,
      exceptionHandler: exceptionHandler,
    );

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () {
      delegate.reset;
      exceptionHandler.reset;

      delegate.stub = () => throw Exception();
      exceptionHandler.stub = () {};

      var _success;
      var _failure;

      runner().when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');
      expect(
        delegate.callCount,
        1,
        reason: '`delegate` houl be called once',
      );
      expect(
        exceptionHandler.callCount,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () {
      delegate.reset;
      exceptionHandler.reset;

      delegate.stub = () => data;
      exceptionHandler.stub = () {};

      var _success;
      var _failure;

      runner().when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');
      expect(
        delegate.callCount,
        1,
        reason: '`delegate` shoul be called once',
      );
      expect(
        exceptionHandler.callCount,
        0,
        reason: '`exceptionHandler` should NOT be called ',
      );
    });
  });

  group('`when` MIXIN on `YakRunnerArgAsync`', () {
    final delegate = MockUnaryDelegate<Future<String>, FutureOr<int>>();
    final exceptionHandler = HandleExceptionDelegateStub();

    final runner = YakRunnerArgAsync<String, int>(
      delegate,
      exceptionHandler: exceptionHandler,
    );

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () async {
      delegate.reset;
      exceptionHandler.reset;

      delegate.stub = () => throw Exception();
      exceptionHandler.stub = () {};

      var _success;
      var _failure;

      (await runner(data)).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');
      expect(
        delegate.callCount,
        1,
        reason: '`delegate` houl be called once',
      );
      expect(
        exceptionHandler.callCount,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () async {
      delegate.reset;
      exceptionHandler.reset;

      delegate.stub = () async => res;
      exceptionHandler.stub = () {};

      var _success;
      var _failure;

      (await runner(data)).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');
      expect(
        delegate.callCount,
        1,
        reason: '`delegate` shoul be called once',
      );
      expect(
        exceptionHandler.callCount,
        0,
        reason: '`exceptionHandler` should NOT be called ',
      );
    });
  });

  group('`when` MIXIN on `YakRunnerAsync`', () {
    final delegate = MockDelegate<Future<int>>();
    final exceptionHandler = HandleExceptionDelegateStub();

    final runner = YakRunnerAsync(
      delegate,
      exceptionHandler: exceptionHandler,
    );

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () async {
      delegate.reset;
      exceptionHandler.reset;

      delegate.stub = () => throw Exception();
      exceptionHandler.stub = () {};

      var _success;
      var _failure;

      (await runner()).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');
      expect(
        delegate.callCount,
        1,
        reason: '`delegate` houl be called once',
      );
      expect(
        exceptionHandler.callCount,
        1,
        reason: '`exceptionHandler` shoul be called once',
      );
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () async {
      delegate.reset;
      exceptionHandler.reset;

      delegate.stub = () async => data;
      exceptionHandler.stub = () {};

      var _success;
      var _failure;

      (await runner()).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');
      expect(
        delegate.callCount,
        1,
        reason: '`delegate` shoul be called once',
      );
      expect(
        exceptionHandler.callCount,
        0,
        reason: '`exceptionHandler` should NOT be called ',
      );
    });
  });
}
