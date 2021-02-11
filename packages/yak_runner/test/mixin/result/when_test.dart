import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../mocks/all.dart';

void main() {
  final _data = 1;
  final _res = '$_data';
  final _errorHandler = MockErrorHandler();
  when(_errorHandler(any, any)).thenAnswer(null);

  group('`when` MIXIN on`YakRunnerArg`', () {
    final _delegate = MockUnaryDelegate<String, int>();
    final _runner = YakRunnerArg<String, int>(_delegate, _errorHandler);

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenThrow(Exception());

      var _success;
      var _failure;

      _runner(_data).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');

      verify(_delegate(_data)).called(1);
      verify(_errorHandler(any, any)).called(1);
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenReturn(_res);

      var _success;
      var _failure;

      _runner(_data).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');

      verify(_delegate(_data)).called(1);
      verifyZeroInteractions(_errorHandler);
    });
  });

  group('`when` MIXIN on `YakRunner`', () {
    final _delegate = MockDelegate<int>();
    final _runner = YakRunner(_delegate, _errorHandler);

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate()).thenThrow(Exception());

      var _success;
      var _failure;

      _runner().when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');

      verify(_delegate()).called(1);
      verify(_errorHandler(any, any)).called(1);
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate()).thenReturn(_data);

      var _success;
      var _failure;

      _runner().when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');

      verify(_delegate()).called(1);
      verifyZeroInteractions(_errorHandler);
    });
  });

  group('`when` MIXIN on `YakRunnerArgAsync`', () {
    final _delegate = MockUnaryDelegate<Future<String>, FutureOr<int>>();
    final _runner = YakRunnerArgAsync<String, int>(_delegate, _errorHandler);

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () async {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenThrow(Exception());

      var _success;
      var _failure;

      (await _runner(_data)).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');

      verify(_delegate(_data)).called(1);
      verify(_errorHandler(any, any)).called(1);
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () async {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate(_data)).thenAnswer((_) async => _res);

      var _success;
      var _failure;

      (await _runner(_data)).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');

      verify(_delegate(_data)).called(1);
      verifyZeroInteractions(_errorHandler);
    });
  });

  group('`when` MIXIN on `YakRunnerAsync`', () {
    final _delegate = MockDelegate<Future<int>>();
    final _runner = YakRunnerAsync(_delegate, _errorHandler);

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () async {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate()).thenThrow(Exception());

      var _success;
      var _failure;

      (await _runner()).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');

      verify(_delegate()).called(1);
      verify(_errorHandler(any, any)).called(1);
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () async {
      reset(_errorHandler);
      reset(_delegate);

      when(_delegate()).thenAnswer((_) async => _data);

      var _success;
      var _failure;

      (await _runner()).when(
        success: (data) => _success = data,
        failure: (_, s) => _failure = s,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');

      verify(_delegate()).called(1);
      verifyZeroInteractions(_errorHandler);
    });
  });
}
