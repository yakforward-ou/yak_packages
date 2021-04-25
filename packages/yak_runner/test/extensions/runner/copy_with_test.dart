import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../mocks/all.dart';

void main() {
  final originalExceptionDelegate = MockHandleExceptionDelegate()
    ..stub.stub = (__) {};
  final replacementExceptionDelegate = MockHandleExceptionDelegate()
    ..stub.stub = (__) {};
  final originaOnSuccessStub = unaryStub()..stub = (_) {};
  final replacementOnSuccessStub = unaryStub()..stub = (_) {};
  final originaErrorHandlerStub = unaryStub()..stub = (_) {};
  final replacementErrorHandlerStub = unaryStub()..stub = (_) {};

  group('RunnerCopyWithX `exceptionHandler` test', () {
    test(
        'GIVEN Runner `exceptionHandler` =! null'
        'WHEN Runner().copyWith(exceptionHandler :  something)'
        'THEN exceptionHandler is replaced', () {
      originalExceptionDelegate.stub.reset;
      replacementExceptionDelegate.stub.reset;

      final runner = Runner(
        () => throw Exception(),
        exceptionHandler: originalExceptionDelegate,
      );
      final newRunner = runner.copyWith(
        exceptionHandler: replacementExceptionDelegate,
      );
      newRunner();

      expect(
        originalExceptionDelegate.stub.count,
        0,
        reason: '"original" exceptionHandler  should not be called',
      );
      expect(
        replacementExceptionDelegate.stub.count,
        1,
        reason: '"replaced" exceptionHandler  should be called once',
      );
    });

    test(
        'GIVEN UnaryRunner `exceptionHandler` =! null'
        'WHEN UnaryRunner().copyWith(exceptionHandler :  something)'
        'THEN exceptionHandler is replaced', () {
      originalExceptionDelegate.stub.reset;
      replacementExceptionDelegate.stub.reset;

      final runner = UnaryRunner(
        (_) => throw Exception(),
        exceptionHandler: originalExceptionDelegate,
      );
      final newRunner = runner.copyWith(
        exceptionHandler: replacementExceptionDelegate,
      );
      newRunner(0);

      expect(
        originalExceptionDelegate.stub.count,
        0,
        reason: '"original" exceptionHandler  should not be called',
      );
      expect(
        replacementExceptionDelegate.stub.count,
        1,
        reason: '"replaced" exceptionHandler  should be called once',
      );
    });
    test(
        'GIVEN RunnerAsync `exceptionHandler` =! null'
        'WHEN RunnerAsync().copyWith(exceptionHandler :  something)'
        'THEN exceptionHandler is replaced', () async {
      originalExceptionDelegate.stub.reset;
      replacementExceptionDelegate.stub.reset;

      final runner = RunnerAsync(
        () async => throw Exception(),
        exceptionHandler: originalExceptionDelegate,
      );
      final newRunner = runner.copyWith(
        exceptionHandler: replacementExceptionDelegate,
      );
      await newRunner();

      expect(
        originalExceptionDelegate.stub.count,
        0,
        reason: '"original" exceptionHandler  should not be called',
      );
      expect(
        replacementExceptionDelegate.stub.count,
        1,
        reason: '"replaced" exceptionHandler  should be called once',
      );
    });
    test(
        'GIVEN UnaryRunnerAsync `exceptionHandler` =! null'
        'WHEN UnaryRunnerAsync().copyWith(exceptionHandler :  something)'
        'THEN exceptionHandler is replaced', () async {
      originalExceptionDelegate.stub.reset;
      replacementExceptionDelegate.stub.reset;

      final runner = UnaryRunnerAsync(
        (_) async => throw Exception(),
        exceptionHandler: originalExceptionDelegate,
      );
      final newRunner = runner.copyWith(
        exceptionHandler: replacementExceptionDelegate,
      );
      await newRunner(0);

      expect(
        originalExceptionDelegate.stub.count,
        0,
        reason: '"original" exceptionHandler should not be called',
      );
      expect(
        replacementExceptionDelegate.stub.count,
        1,
        reason: '"replaced" exceptionHandler should be called once',
      );
    });
  });

  group('RunnerCopyWithX `onSuccess` test', () {
    test(
        'GIVEN Runner `onSuccess` isNotEmpty'
        'WHEN Runner().copyWith(exceptionHandler :  something)'
        'THEN exceptionHandler is replaced', () {
      originaOnSuccessStub.reset;
      replacementOnSuccessStub.reset;

      final runner = Runner(
        () {},
        onSuccess: [originaOnSuccessStub.wrap],
      );
      final newRunner = runner.copyWith(
        onSuccess: [replacementOnSuccessStub.wrap],
      );
      newRunner();

      expect(
        originaOnSuccessStub.count,
        0,
        reason: '"original" onSuccess  should not be called',
      );
      expect(
        replacementOnSuccessStub.count,
        1,
        reason: '"replaced" onSuccess  should be called once',
      );
    });

    test(
        'GIVEN UnaryRunner `onSuccess` =! null'
        'WHEN UnaryRunner().copyWith(onSuccess :  something)'
        'THEN onSuccess is replaced', () {
      originaOnSuccessStub.reset;
      replacementOnSuccessStub.reset;

      final runner = UnaryRunner(
        (_) {},
        onSuccess: [originaOnSuccessStub.wrap],
      );
      final newRunner = runner.copyWith(
        onSuccess: [replacementOnSuccessStub.wrap],
      );
      newRunner(0);

      expect(
        originaOnSuccessStub.count,
        0,
        reason: '"original" onSuccess  should not be called',
      );
      expect(
        replacementOnSuccessStub.count,
        1,
        reason: '"replaced" onSuccess  should be called once',
      );
    });
    test(
        'GIVEN RunnerAsync `onSuccess` =! null'
        'WHEN RunnerAsync().copyWith(onSuccess :  something)'
        'THEN onSuccess is replaced', () async {
      originaOnSuccessStub.reset;
      replacementOnSuccessStub.reset;

      final runner = RunnerAsync(
        () async {},
        onSuccess: [originaOnSuccessStub.wrap],
      );
      final newRunner = runner.copyWith(
        onSuccess: [replacementOnSuccessStub.wrap],
      );
      await newRunner();

      expect(
        originaOnSuccessStub.count,
        0,
        reason: '"original" onSuccess  should not be called',
      );
      expect(
        replacementOnSuccessStub.count,
        1,
        reason: '"replaced" onSuccess  should be called once',
      );
    });
    test(
        'GIVEN UnaryRunnerAsync `onSuccess` =! null'
        'WHEN UnaryRunnerAsync().copyWith(onSuccess :  something)'
        'THEN onSuccess is replaced', () async {
      originaOnSuccessStub.reset;
      replacementOnSuccessStub.reset;

      final runner = UnaryRunnerAsync(
        (_) async {},
        onSuccess: [originaOnSuccessStub.wrap],
      );
      final newRunner = runner.copyWith(
        onSuccess: [replacementOnSuccessStub.wrap],
      );
      await newRunner(0);

      expect(
        originaOnSuccessStub.count,
        0,
        reason: '"original" onSuccess  should not be called',
      );
      expect(
        replacementOnSuccessStub.count,
        1,
        reason: '"replaced" onSuccess  should be called once',
      );
    });
  });

  group('RunnerCopyWithX `errorHandler` test', () {
    test(
        'GIVEN Runner `errorHandler` isNotEmpty'
        'WHEN Runner().copyWith(errorHandler :  something)'
        'THEN errorHandler is replaced', () {
      originaErrorHandlerStub.reset;
      replacementErrorHandlerStub.reset;

      final runner = Runner(
        () {
          avow(false);
          return 0;
        },
        errorHandlers: {AvowError().handle(originaErrorHandlerStub.wrap)},
      );
      final newRunner = runner.copyWith(
        errorHandlers: {AvowError().handle(replacementErrorHandlerStub.wrap)},
      );
      newRunner();

      expect(
        originaErrorHandlerStub.count,
        0,
        reason: '"original" errorHandler  should not be called',
      );
      expect(
        replacementErrorHandlerStub.count,
        1,
        reason: '"replaced" errorHandler  should be called once',
      );
    });

    test(
        'GIVEN UnaryRunner `errorHandler` =! null'
        'WHEN UnaryRunner().copyWith(errorHandler :  something)'
        'THEN errorHandler is replaced', () {
      originaErrorHandlerStub.reset;
      replacementErrorHandlerStub.reset;

      final runner = UnaryRunner(
        (_) {
          avow(false);
          return 0;
        },
        errorHandlers: {AvowError().handle(originaErrorHandlerStub.wrap)},
      );
      final newRunner = runner.copyWith(
        errorHandlers: {AvowError().handle(replacementErrorHandlerStub.wrap)},
      );
      newRunner(0);

      expect(
        originaErrorHandlerStub.count,
        0,
        reason: '"original" errorHandler  should not be called',
      );
      expect(
        replacementErrorHandlerStub.count,
        1,
        reason: '"replaced" errorHandler    should be called once',
      );
    });
    test(
        'GIVEN RunnerAsync `errorHandler` =! null'
        'WHEN RunnerAsync().copyWith(errorHandler :  something)'
        'THEN errorHandler is replaced', () async {
      originaErrorHandlerStub.reset;
      replacementErrorHandlerStub.reset;
      final runner = RunnerAsync(
        () async {
          avow(false);
          return 0;
        },
        errorHandlers: {AvowError().handle(originaErrorHandlerStub.wrap)},
      );
      final newRunner = runner.copyWith(
        errorHandlers: {AvowError().handle(replacementErrorHandlerStub.wrap)},
      );
      await newRunner();

      expect(
        originaErrorHandlerStub.count,
        0,
        reason: '"original" errorHandler  should not be called',
      );
      expect(
        replacementErrorHandlerStub.count,
        1,
        reason: '"replaced" errorHandler    should be called once',
      );
    });
    test(
        'GIVEN UnaryRunnerAsync `errorHandler` =! null'
        'WHEN UnaryRunnerAsync().copyWith(errorHandler :  something)'
        'THEN exceptierrorHandleronHandler is replaced', () async {
      originaErrorHandlerStub.reset;
      replacementErrorHandlerStub.reset;
      final runner = UnaryRunnerAsync(
        (_) async {
          avow(false);
          return 0;
        },
        errorHandlers: {AvowError().handle(originaErrorHandlerStub.wrap)},
      );
      final newRunner = runner.copyWith(
        errorHandlers: {AvowError().handle(replacementErrorHandlerStub.wrap)},
      );
      await newRunner(0);

      expect(
        originaErrorHandlerStub.count,
        0,
        reason: '"original" errorHandler    should not be called',
      );
      expect(
        replacementErrorHandlerStub.count,
        1,
        reason: '"replaced" errorHandler    should be called once',
      );
    });
  });
}
