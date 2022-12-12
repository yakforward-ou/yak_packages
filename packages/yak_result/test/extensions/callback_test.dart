import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('Unary', () {
    group('CallbackOnValueResultX', () {
      group('on Success', () {
        final tester = Stub.nullary<ValueResult<int>>();
        final function = Stub.unary<VoidResult, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () {
          tester.stub = () => ValueSuccess(0);
          function.stub = (value) => VoidSuccess();

          expect(
            tester().callback(function),
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
            tester().callback(function),
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
        final function = Stub.unary<VoidResult, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Success '
            'THEN result is Failure', () {
          tester.stub = () => Failure();
          function.stub = (value) => VoidSuccess();

          expect(
            tester().callback(function),
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
            tester().callback(function),
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
    group('CallbackOnValueResultAsyncX', () {
      group('on Success', () {
        final tester = Stub.nullary<ValueResult<int>>();
        final function = Stub.unary<FutureVoidResult, int>();
        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () async {
          tester.stub = () => ValueSuccess(0);
          function.stub = (value) => Future.sync(() => VoidSuccess());

          expect(
            await tester().callbackAsync(function),
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
            await tester().callbackAsync(function),
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
        final function = Stub.unary<FutureVoidResult, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Success '
            'THEN result is Failure', () async {
          tester.stub = () => Failure();
          function.stub = (value) => Future.sync(() => VoidSuccess());

          expect(
            await tester().callbackAsync(function),
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
            await tester().callbackAsync(function),
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
    group('CallbackOnFutureValueResultX', () {
      group('on Success', () {
        final tester = Stub.nullary<FutureValueResult<int>>();
        final function = Stub.unary<FutureVoidResult, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () async {
          tester.stub = () => Future.sync(() => ValueSuccess(0));
          function.stub = (value) => Future.sync(() => VoidSuccess());

          expect(
            await tester().callback(function),
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
            await tester().callback(function),
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
        final function = Stub.unary<FutureVoidResult, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Success '
            'THEN result is Failure', () async {
          tester.stub = () => Future.sync(() => Failure());
          function.stub = (value) => Future.sync(() => VoidSuccess());

          expect(
            await tester().callback(function),
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
            await tester().callback(function),
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
    group('CallbackOnVoidResultX', () {
      group('on Success', () {
        final tester = Stub.nullary<VoidResult>();
        final function = Stub.nullary<VoidResult>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () {
          tester.stub = () => VoidSuccess();
          function.stub = () => VoidSuccess();

          expect(
            tester().callback(function),
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
            tester().callback(function),
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
        final function = Stub.nullary<VoidResult>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Success '
            'THEN result is Failure', () {
          tester.stub = () => Failure();
          function.stub = () => VoidSuccess();

          expect(
            tester().callback(function),
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
            tester().callback(function),
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
    group('CallbackOnVoidResultAsyncX', () {
      group('on Success', () {
        final tester = Stub.nullary<VoidResult>();
        final function = Stub.nullary<FutureVoidResult>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () async {
          tester.stub = () => VoidSuccess();
          function.stub = () => Future.sync(() => VoidSuccess());

          expect(
            await tester().callbackAsync(function),
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
            await tester().callbackAsync(function),
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
        final function = Stub.nullary<FutureVoidResult>();

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
            await tester().callbackAsync(function),
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
            await tester().callbackAsync(function),
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
    group('CallbackOnFutureVoidResultX', () {
      group('on Success', () {
        final tester = Stub.nullary<FutureVoidResult>();
        final function = Stub.nullary<FutureVoidResult>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Success '
            'WHEN function returns Success '
            'THEN result is Success', () async {
          tester.stub = () => Future.sync(() => VoidSuccess());
          function.stub = () => Future.sync(() => VoidSuccess());

          expect(
            await tester().callback(function),
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
            await tester().callback(function),
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
        final function = Stub.nullary<FutureVoidResult>();

        setUp(() {
          tester.reset();
          function.reset();
        });
        test(
            'GIVEN Result is Failure '
            'WHEN function returns Success '
            'THEN result is Failure', () async {
          tester.stub = () => Future.sync(() => Failure());
          function.stub = () => Future.sync(() => VoidSuccess());
          expect(
            await tester().callback(function),
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
            await tester().callback(function),
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
