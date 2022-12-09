import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('Unary', () {
    group('OnValueResultX', () {
      group('on Success', () {
        final tester = Stub.nullary<ValueResult<int>>();
        final function = Stub.unary<ValueResult<int>, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () {
          tester.stub = () => ValueSuccess(0);
          function.stub = (value) => ValueSuccess(value + 1);

          expect(
            tester().thenRun(function),
            isA<Success>(),
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Failure '
            'THEN result is Success', () {
          tester.stub = () => ValueSuccess(0);
          function.stub = (_) => Failure();

          expect(
            tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
      });
      group('on Failure', () {
        final tester = Stub.nullary<ValueResult<int>>();
        final function = Stub.unary<ValueResult<int>, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Success '
            'THEN result is Failure', () {
          tester.stub = () => Failure();
          function.stub = (value) => ValueSuccess(value + 1);

          expect(
            tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Failure '
            'THEN result is Failure', () {
          tester.stub = () => Failure();
          function.stub = (_) => Failure();

          expect(
            tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
      });
    });
    group('OnValueResultAsyncX', () {
      group('on Success', () {
        final tester = Stub.nullary<ValueResult<int>>();
        final function = Stub.unary<FutureValueResult<int>, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () async {
          tester.stub = () => ValueSuccess(0);
          function.stub = (value) => Future.sync(() => ValueSuccess(value + 1));

          expect(
            await tester().thenRunAsync(function),
            isA<Success>(),
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Failure '
            'THEN result is Success', () async {
          tester.stub = () => ValueSuccess(0);
          function.stub = (_) => Future.sync(() => Failure());

          expect(
            await tester().thenRunAsync(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
      });
      group('on Failure', () {
        final tester = Stub.nullary<ValueResult<int>>();
        final function = Stub.unary<FutureValueResult<int>, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Success '
            'THEN result is Failure', () async {
          tester.stub = () => Failure();
          function.stub = (value) => Future.sync(() => ValueSuccess(value + 1));

          expect(
            await tester().thenRunAsync(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Failure '
            'THEN result is Failure', () async {
          tester.stub = () => Failure();
          function.stub = (_) => Future.sync(() => Failure());

          expect(
            await tester().thenRunAsync(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
      });
    });
    group('OnFutureValueResultX', () {
      group('on Success', () {
        final tester = Stub.nullary<FutureValueResult<int>>();
        final function = Stub.unary<FutureValueResult<int>, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () async {
          tester.stub = () => Future.sync(() => ValueSuccess(0));
          function.stub = (value) => Future.sync(() => ValueSuccess(value + 1));

          expect(
            await tester().thenRun(function),
            isA<Success>(),
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Failure '
            'THEN result is Success', () async {
          tester.stub = () => Future.sync(() => ValueSuccess(0));
          function.stub = (_) => Future.sync(() => Failure());

          expect(
            await tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
      });
      group('on Failure', () {
        final tester = Stub.nullary<FutureValueResult<int>>();
        final function = Stub.unary<FutureValueResult<int>, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Success '
            'THEN result is Failure', () async {
          tester.stub = () => Future.sync(() => Failure());
          function.stub = (value) => Future.sync(() => ValueSuccess(value + 1));

          expect(
            await tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Failure '
            'THEN result is Failure', () async {
          tester.stub = () => Future.sync(() => Failure());
          function.stub = (_) => Future.sync(() => Failure());

          expect(
            await tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
      });
    });
  });
  group('Nullary', () {
    group('OnVoidResultX', () {
      group('on Success', () {
        final tester = Stub.nullary<VoidResult>();
        final function = Stub.nullary<ValueResult<int>>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () {
          tester.stub = () => VoidSuccess();
          function.stub = () => ValueSuccess(1);

          expect(
            tester().thenRun(function),
            isA<Success>(),
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Failure '
            'THEN result is Success', () {
          tester.stub = () => VoidSuccess();
          function.stub = () => Failure();

          expect(
            tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
      });
      group('on Failure', () {
        final tester = Stub.nullary<VoidResult>();
        final function = Stub.nullary<ValueResult<int>>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Success '
            'THEN result is Failure', () {
          tester.stub = () => Failure();
          function.stub = () => ValueSuccess(1);

          expect(
            tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Failure '
            'THEN result is Failure', () {
          tester.stub = () => Failure();
          function.stub = () => Failure();

          expect(
            tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
      });
    });
    group('OnVoidResultAsyncX', () {
      group('on Success', () {
        final tester = Stub.nullary<VoidResult>();
        final function = Stub.nullary<FutureValueResult<int>>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () async {
          tester.stub = () => VoidSuccess();
          function.stub = () => Future.sync(() => ValueSuccess(1));

          expect(
            await tester().thenRunAsync<int>(function),
            isA<Success>(),
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Failure '
            'THEN result is Success', () async {
          tester.stub = () => VoidSuccess();
          function.stub = () => Future.sync(() => Failure());

          expect(
            await tester().thenRunAsync(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
      });
      group('on Failure', () {
        final tester = Stub.nullary<VoidResult>();
        final function = Stub.nullary<FutureValueResult<int>>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Success '
            'THEN result is Failure', () async {
          tester.stub = () => Failure();
          function.stub = () => Future.sync(() => Failure());
          expect(
            await tester().thenRunAsync(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Failure '
            'THEN result is Failure', () async {
          tester.stub = () => Failure();
          function.stub = () => Future.sync(() => Failure());

          expect(
            await tester().thenRunAsync(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
      });
    });
    group('OnFutureVoidResultX', () {
      group('on Success', () {
        final tester = Stub.nullary<FutureVoidResult>();
        final function = Stub.nullary<FutureValueResult<int>>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () async {
          tester.stub = () => Future.sync(() => VoidSuccess());
          function.stub = () => Future.sync(() => ValueSuccess(1));

          expect(
            await tester().thenRun(function),
            isA<Success>(),
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Failure '
            'THEN result is Success', () async {
          tester.stub = () => Future.sync(() => VoidSuccess());
          function.stub = () => Future.sync(() => Failure());

          expect(
            await tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
      });
      group('on Failure', () {
        final tester = Stub.nullary<FutureVoidResult>();
        final function = Stub.nullary<FutureValueResult<int>>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Success '
            'THEN result is Failure', () async {
          tester.stub = () => Future.sync(() => Failure());
          function.stub = () => Future.sync(() => Failure());
          expect(
            await tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Failure '
            'THEN result is Failure', () async {
          tester.stub = () => Future.sync(() => Failure());
          function.stub = () => Future.sync(() => Failure());

          expect(
            await tester().thenRun(function),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should NOT be called',
          );
        });
      });
    });
  });
}
