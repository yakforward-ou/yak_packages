import 'dart:async';

import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  const data = 1;
  final reportStub = unaryStub<void, ErrorReport>()..stub = (_) {};
  group('`when` MIXIN on`UnaryRunner`', () {
    final delegate = unaryStub<String, int>();
    final runner = UnaryRunner<String, int>(
      delegate.wrap,
      errorReport: reportStub.wrap,
    );

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () {
      delegate.reset;
      reportStub.reset;

      delegate.stub = (i) => throw Exception();

      var _success;
      var _failure;

      runner(data).when(
        success: (data) => _success = data,
        failure: (report) => _failure = report,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');
      expect(
        delegate.count,
        1,
        reason: '`delegate` houl be called once',
      );
      expect(
        reportStub.count,
        1,
        reason: '`reportStub` shoul be called once',
      );
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () {
      delegate.reset;
      reportStub.reset;

      delegate.stub = (i) => '$i';

      var _success;
      var _failure;

      runner(data).when(
        success: (data) => _success = data,
        failure: (report) => _failure = report,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');
      expect(
        delegate.count,
        1,
        reason: '`delegate` shoul be called once',
      );
      expect(
        reportStub.count,
        0,
        reason: '`reportStub` should NOT be called ',
      );
    });
  });

  group('`when` MIXIN on `Runner`', () {
    final delegate = nullaryStub<int>();
    final runner = Runner(
      delegate.wrap,
      errorReport: reportStub.wrap,
    );

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () {
      delegate.reset;
      reportStub.reset;

      delegate.stub = () => throw Exception();

      var _success;
      var _failure;

      runner().when(
        success: (data) => _success = data,
        failure: (report) => _failure = report,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');
      expect(
        delegate.count,
        1,
        reason: '`delegate` houl be called once',
      );
      expect(
        reportStub.count,
        1,
        reason: '`reportStub` shoul be called once',
      );
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () {
      delegate.reset;
      reportStub.reset;

      delegate.stub = () => data;

      var _success;
      var _failure;

      runner().when(
        success: (data) => _success = data,
        failure: (report) => _failure = report,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');
      expect(
        delegate.count,
        1,
        reason: '`delegate` shoul be called once',
      );
      expect(
        reportStub.count,
        0,
        reason: '`reportStub` should NOT be called ',
      );
    });
  });

  group('`when` MIXIN on `UnaryRunnerAsync`', () {
    final delegate = unaryStub<Future<String>, FutureOr<int>>();

    final runner = UnaryRunnerAsync<String, int>(
      delegate.wrap,
      errorReport: reportStub.wrap,
    );

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () async {
      delegate.reset;
      reportStub.reset;

      delegate.stub = (i) => throw Exception();

      var _success;
      var _failure;

      (await runner(data)).when(
        success: (data) => _success = data,
        failure: (report) => _failure = report,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');
      expect(
        delegate.count,
        1,
        reason: '`delegate` houl be called once',
      );
      expect(
        reportStub.count,
        1,
        reason: '`reportStub` shoul be called once',
      );
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () async {
      delegate.reset;
      reportStub.reset;

      delegate.stub = (i) async => '$i';

      var _success;
      var _failure;

      (await runner(data)).when(
        success: (data) => _success = data,
        failure: (report) => _failure = report,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');
      expect(
        delegate.count,
        1,
        reason: '`delegate` shoul be called once',
      );
      expect(
        reportStub.count,
        0,
        reason: '`reportStub` should NOT be called ',
      );
    });
  });

  group('`when` MIXIN on `RunnerAsync`', () {
    final delegate = nullaryStub<Future<int>>();

    final runner = RunnerAsync(
      delegate.wrap,
      errorReport: reportStub.wrap,
    );

    test('WHEN `Result`is `Failure` then `when(failure:)` is called', () async {
      delegate.reset;
      reportStub.reset;

      delegate.stub = () => throw Exception();

      var _success;
      var _failure;

      (await runner()).when(
        success: (data) => _success = data,
        failure: (report) => _failure = report,
      );

      expect(_success != null, false, reason: '`success:`should not be called');
      expect(_failure != null, true, reason: '`failure:`should be called');
      expect(
        delegate.count,
        1,
        reason: '`delegate` houl be called once',
      );
      expect(
        reportStub.count,
        1,
        reason: '`reportStub` shoul be called once',
      );
    });

    test('WHEN `Result`is `Success` then `when(success:)` is called', () async {
      delegate.reset;
      reportStub.reset;

      delegate.stub = () async => data;

      var _success;
      var _failure;

      (await runner()).when(
        success: (data) => _success = data,
        failure: (report) => _failure = report,
      );

      expect(_success != null, true, reason: '`success:`should be called');
      expect(_failure != null, false, reason: '`failure:`should not be called');
      expect(
        delegate.count,
        1,
        reason: '`delegate` shoul be called once',
      );
      expect(
        reportStub.count,
        0,
        reason: '`reportStub` should NOT be called ',
      );
    });
  });
}
