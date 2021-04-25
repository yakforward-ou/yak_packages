import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  final onSuccessStub = unaryStub()..stub = (_) {};
  final alsoOnSuccessStub = unaryStub()..stub = (_) {};
  final errorHandlerStub = unaryStub()..stub = (_) {};
  final alsoErrorHandlerStub = unaryStub()..stub = (_) {};

  group('RunnerAppendX test', () {
    test(
        'GIVEN Runner().append(onSuccess :  something())'
        'WHEN when Runner is Success '
        'THEN something is called', () {
      onSuccessStub.reset;
      alsoOnSuccessStub.reset;

      final runner = Runner(() => 'hello', onSuccess: [onSuccessStub.wrap]);
      final newRunner = runner.append(onSuccess: [alsoOnSuccessStub.wrap]);
      newRunner();

      expect(
        onSuccessStub.count,
        1,
        reason: 'onSuccessStub should be called once',
      );

      expect(
        alsoOnSuccessStub.count,
        1,
        reason: 'alsoOnSuccessStub should be called once',
      );
    });
    test(
        'GIVEN RunnerAsync().append(onSuccess :  something())'
        'WHEN when Runner is Success '
        'THEN something is called', () async {
      onSuccessStub.reset;
      alsoOnSuccessStub.reset;

      final runner = RunnerAsync(
        () async => 'hello',
        onSuccess: [onSuccessStub.wrap],
      );
      final newRunner = runner.append(onSuccess: [alsoOnSuccessStub.wrap]);
      await newRunner();

      expect(
        onSuccessStub.count,
        1,
        reason: 'onSuccessStub should be called once',
      );

      expect(
        alsoOnSuccessStub.count,
        1,
        reason: 'alsoOnSuccessStub should be called once',
      );
    });
    test(
        'GIVEN UnaryRunner().append(onSuccess :  something())'
        'WHEN when Runner is Success '
        'THEN something is called', () {
      onSuccessStub.reset;
      alsoOnSuccessStub.reset;

      final runner = UnaryRunner(
        (_) => 'hello',
        onSuccess: [onSuccessStub.wrap],
      );
      final newRunner = runner.append(onSuccess: [alsoOnSuccessStub.wrap]);
      newRunner(0);

      expect(
        onSuccessStub.count,
        1,
        reason: 'onSuccessStub should be called once',
      );

      expect(
        alsoOnSuccessStub.count,
        1,
        reason: 'alsoOnSuccessStub should be called once',
      );
    });
    test(
        'GIVEN UnaryRunnerAsync().append(onSuccess :  something())'
        'WHEN when Runner is Success '
        'THEN something is called', () async {
      onSuccessStub.reset;
      alsoOnSuccessStub.reset;

      final runner = UnaryRunnerAsync(
        (_) async => 'hello',
        onSuccess: [onSuccessStub.wrap],
      );
      final newRunner = runner.append(onSuccess: [alsoOnSuccessStub.wrap]);
      await newRunner(0);

      expect(
        onSuccessStub.count,
        1,
        reason: 'onSuccessStub should be called once',
      );

      expect(
        alsoOnSuccessStub.count,
        1,
        reason: 'alsoOnSuccessStub should be called once',
      );
    });
    test(
        'GIVEN Runner().append(errorHandlers :  {something})'
        'WHEN when Runner is Error '
        'THEN something is called', () {
      errorHandlerStub.reset;
      alsoErrorHandlerStub.reset;

      final runner = Runner(
        () {
          avow(false);
          return 'hello';
        },
        errorHandlers: {AvowError().handle(errorHandlerStub.wrap)},
      );
      final newRunner = runner.append(
        errorHandlers: {AvowError().handle(alsoErrorHandlerStub.wrap)},
      );
      newRunner();

      expect(
        errorHandlerStub.count,
        0,
        reason: 'errorHandlerStub should not be called',
      );

      expect(
        alsoErrorHandlerStub.count,
        1,
        reason: 'alsoErrorHandlerStub should be called once',
      );
    });
    test(
        'GIVEN RunnerAsync().append(errorHandlers :  {something})'
        'WHEN when Runner is Error '
        'THEN something is called', () async {
      errorHandlerStub.reset;
      alsoErrorHandlerStub.reset;

      final runner = RunnerAsync(
        () async {
          avow(false);
          return 'hello';
        },
        errorHandlers: {AvowError().handle(errorHandlerStub.wrap)},
      );
      final newRunner = runner.append(
        errorHandlers: {AvowError().handle(alsoErrorHandlerStub.wrap)},
      );
      await newRunner();

      expect(
        errorHandlerStub.count,
        0,
        reason: 'errorHandlerStub should not be called',
      );

      expect(
        alsoErrorHandlerStub.count,
        1,
        reason: 'alsoErrorHandlerStub should be called once',
      );
    });
    test(
        'GIVEN UnaryRunner().append(errorHandlers :  {something})'
        'WHEN when Runner is Error '
        'THEN something is called', () {
      errorHandlerStub.reset;
      alsoErrorHandlerStub.reset;

      final runner = UnaryRunner(
        (_) {
          avow(false);
          return 'hello';
        },
        errorHandlers: {AvowError().handle(errorHandlerStub.wrap)},
      );
      final newRunner = runner.append(
        errorHandlers: {AvowError().handle(alsoErrorHandlerStub.wrap)},
      );
      newRunner(0);

      expect(
        errorHandlerStub.count,
        0,
        reason: 'errorHandlerStub should not be called',
      );

      expect(
        alsoErrorHandlerStub.count,
        1,
        reason: 'alsoErrorHandlerStub should be called once',
      );
    });
    test(
        'GIVEN Runner().append(errorHandlers :  {something})'
        'WHEN when Runner is Error '
        'THEN something is called', () async {
      errorHandlerStub.reset;
      alsoErrorHandlerStub.reset;

      final runner = UnaryRunnerAsync(
        (_) async {
          avow(false);
          return 'hello';
        },
        errorHandlers: {AvowError().handle(errorHandlerStub.wrap)},
      );
      final newRunner = runner.append(
        errorHandlers: {AvowError().handle(alsoErrorHandlerStub.wrap)},
      );
      await newRunner(0);

      expect(
        errorHandlerStub.count,
        0,
        reason: 'errorHandlerStub should not be called',
      );

      expect(
        alsoErrorHandlerStub.count,
        1,
        reason: 'alsoErrorHandlerStub should be called once',
      );
    });
  });
}
