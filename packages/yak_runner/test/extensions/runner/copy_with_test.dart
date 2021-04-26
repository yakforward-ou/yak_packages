import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  final originalreportStub = unaryStub<void, ErrorReport>()..stub = (_) {};
  final replacementreportStub = unaryStub<void, ErrorReport>()..stub = (_) {};
  final originaOnSuccessStub = unaryStub()..stub = (_) {};
  final replacementOnSuccessStub = unaryStub()..stub = (_) {};
  final originaErrorHandlerStub = unaryStub<void, AvowError>()..stub = (_) {};
  final replacementErrorHandlerStub = unaryStub<void, AvowError>()
    ..stub = (_) {};

  group('RunnerCopyWithX `errorReport` test', () {
    test(
        'GIVEN Runner `errorReport` =! null'
        'WHEN Runner().copyWith(errorReport :  something)'
        'THEN errorReport is replaced', () {
      originalreportStub.reset;
      replacementreportStub.reset;

      final runner = Runner(
        () => throw Exception(),
        errorReport: originalreportStub.wrap,
      );
      final newRunner = runner.copyWith(
        errorReport: replacementreportStub.wrap,
      );
      newRunner();

      expect(
        originalreportStub.count,
        0,
        reason: '"original" errorReport  should not be called',
      );
      expect(
        replacementreportStub.count,
        1,
        reason: '"replaced" errorReport  should be called once',
      );
    });

    test(
        'GIVEN UnaryRunner `errorReport` =! null'
        'WHEN UnaryRunner().copyWith(errorReport :  something)'
        'THEN errorReport is replaced', () {
      originalreportStub.reset;
      replacementreportStub.reset;

      final runner = UnaryRunner(
        (_) => throw Exception(),
        errorReport: originalreportStub.wrap,
      );
      final newRunner = runner.copyWith(
        errorReport: replacementreportStub.wrap,
      );
      newRunner(0);

      expect(
        originalreportStub.count,
        0,
        reason: '"original" errorReport  should not be called',
      );
      expect(
        replacementreportStub.count,
        1,
        reason: '"replaced" errorReport  should be called once',
      );
    });
    test(
        'GIVEN RunnerAsync `errorReport` =! null'
        'WHEN RunnerAsync().copyWith(errorReport :  something)'
        'THEN errorReport is replaced', () async {
      originalreportStub.reset;
      replacementreportStub.reset;

      final runner = RunnerAsync(
        () async => throw Exception(),
        errorReport: originalreportStub.wrap,
      );
      final newRunner = runner.copyWith(
        errorReport: replacementreportStub.wrap,
      );
      await newRunner();

      expect(
        originalreportStub.count,
        0,
        reason: '"original" errorReport  should not be called',
      );
      expect(
        replacementreportStub.count,
        1,
        reason: '"replaced" errorReport  should be called once',
      );
    });
    test(
        'GIVEN UnaryRunnerAsync `errorReport` =! null'
        'WHEN UnaryRunnerAsync().copyWith(errorReport :  something)'
        'THEN errorReport is replaced', () async {
      originalreportStub.reset;
      replacementreportStub.reset;

      final runner = UnaryRunnerAsync(
        (_) async => throw Exception(),
        errorReport: originalreportStub.wrap,
      );
      final newRunner = runner.copyWith(
        errorReport: replacementreportStub.wrap,
      );
      await newRunner(0);

      expect(
        originalreportStub.count,
        0,
        reason: '"original" errorReport should not be called',
      );
      expect(
        replacementreportStub.count,
        1,
        reason: '"replaced" errorReport should be called once',
      );
    });
  });

  group('RunnerCopyWithX `onSuccess` test', () {
    test(
        'GIVEN Runner `onSuccess` isNotEmpty'
        'WHEN Runner().copyWith(errorReport :  something)'
        'THEN errorReport is replaced', () {
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
        errorHandlers: {originaErrorHandlerStub.wrap.handler()},
      );
      expect(
        runner.errorHandlers.first.report,
        false,
        reason: 'report should be false',
      );
      final newRunner = runner.copyWith(
        errorHandlers: {replacementErrorHandlerStub.wrap.handler(report: true)},
      );

      expect(
        newRunner.errorHandlers.first.report,
        true,
        reason: 'report should be true',
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
        errorHandlers: {originaErrorHandlerStub.wrap.handler()},
      );

      expect(
        runner.errorHandlers.first.report,
        false,
        reason: 'report should be false',
      );

      final newRunner = runner.copyWith(
        errorHandlers: {replacementErrorHandlerStub.wrap.handler(report: true)},
      );

      expect(
        newRunner.errorHandlers.first.report,
        true,
        reason: 'report should be true',
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
        errorHandlers: {originaErrorHandlerStub.wrap.handler()},
      );
      expect(
        runner.errorHandlers.first.report,
        false,
        reason: 'report should be false',
      );
      final newRunner = runner.copyWith(
        errorHandlers: {replacementErrorHandlerStub.wrap.handler(report: true)},
      );

      expect(
        newRunner.errorHandlers.first.report,
        true,
        reason: 'report should be true',
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
        errorHandlers: {originaErrorHandlerStub.wrap.handler()},
      );
      expect(
        runner.errorHandlers.first.report,
        false,
        reason: 'report should be false',
      );
      final newRunner = runner.copyWith(
        errorHandlers: {replacementErrorHandlerStub.wrap.handler(report: true)},
      );

      expect(
        newRunner.errorHandlers.first.report,
        true,
        reason: 'report should be true',
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
