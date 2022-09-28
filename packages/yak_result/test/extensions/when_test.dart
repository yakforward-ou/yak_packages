import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('WhenX', () {
    const data = 'hello';
    final tester = Stub.nullary<Result<String>>();
    final onSuccess = Stub.unary<int, String>()..stub = (i) => 0;
    final onFailure = Stub.unary<int, Failure<String>>()..stub = (f) => 0;
    final onPending = Stub.nullary()..stub = (() => 0);

    setUp(() {
      onSuccess.reset();
      onFailure.reset();
      onPending.reset();
      tester.reset();
    });

    test('GIVEN ... ' 'WHEN is Success' 'THEN function is called', () {
      tester.stub = () => const Success(data);
      final result = tester();
      expect(
        result.when(
          onSuccess: onSuccess,
          onFailure: onFailure,
          onPending: onPending,
        ),
        isA<int?>(),
        reason: 'should be correct',
      );

      expect(
        onSuccess.count,
        equals(1),
        reason: 'should called once',
      );

      expect(
        onFailure.count,
        equals(0),
        reason: 'should not called',
      );

      expect(
        onPending.count,
        equals(0),
        reason: 'should not called',
      );
    });

    test('GIVEN ... ' 'WHEN is Failure' 'THEN function is called', () {
      tester.stub = () => Failure();
      final result = tester();

      expect(
        result.when(onSuccess: onSuccess, onFailure: onFailure),
        isA<int?>(),
        reason: 'should be correct',
      );

      expect(
        onFailure.count,
        equals(1),
        reason: 'should called once',
      );

      expect(
        onSuccess.count,
        equals(0),
        reason: 'should not called',
      );

      expect(
        onPending.count,
        equals(0),
        reason: 'should not called',
      );
    });

    test('GIVEN ... ' 'WHEN is Failure' 'THEN function is called', () {
      tester.stub = () => Failure();
      final result = tester();

      expect(
        result.when(onSuccess: onSuccess, onFailure: onFailure),
        isA<int?>(),
        reason: 'should be correct',
      );

      expect(
        onFailure.count,
        equals(1),
        reason: 'should called once',
      );

      expect(
        onSuccess.count,
        equals(0),
        reason: 'should not called',
      );

      expect(
        onPending.count,
        equals(0),
        reason: 'should not called',
      );
    });
  });

  group('WhenAsyncX', () {
    const data = 'hello';
    final tester = Stub.nullary<Result<String>>();
    final onSuccess = Stub.unary<Future<int>, String>()
      ..stub = (_) => Future.sync(() => 0);
    final onFailure = Stub.unary<Future<int>, Failure<String>>()
      ..stub = (_) => Future.sync(() => 0);
    final onPending = Stub.nullary<Future<int>>()
      ..stub = () => Future.sync(() => 0);

    setUp(() {
      onSuccess.reset();
      onFailure.reset();
      onPending.reset();
      tester.reset();
    });
    test('GIVEN ... ' 'WHEN is Success' 'THEN function is called', () async {
      tester.stub = () => const Success(data);
      final result = tester();

      expect(
        await result.whenAsync(
          onSuccess: onSuccess,
          onFailure: onFailure,
          onPending: onPending,
        ),
        isA<int?>(),
        reason: 'should be correct',
      );

      expect(
        onSuccess.count,
        equals(1),
        reason: 'should called once',
      );

      expect(
        onFailure.count,
        equals(0),
        reason: 'should not called',
      );

      expect(
        onPending.count,
        equals(0),
        reason: 'should not called',
      );
    });

    test('GIVEN ... ' 'WHEN is Failure' 'THEN function is called', () async {
      tester.stub = () => Failure();
      final result = tester();

      expect(
        await result.whenAsync(
          onSuccess: onSuccess,
          onFailure: onFailure,
          onPending: onPending,
        ),
        isA<int?>(),
        reason: 'should be correct',
      );

      expect(
        onSuccess.count,
        equals(0),
        reason: 'should not called',
      );

      expect(
        onFailure.count,
        equals(1),
        reason: 'should called once',
      );

      expect(
        onPending.count,
        equals(0),
        reason: 'should not called',
      );
    });
    test('GIVEN ... ' 'WHEN is Pending' 'THEN function is called', () async {
      tester.stub = () => Pending();
      final result = tester();

      expect(
        await result.whenAsync(
          onSuccess: onSuccess,
          onFailure: onFailure,
          onPending: onPending,
        ),
        isA<int?>(),
        reason: 'should be correct',
      );

      expect(
        onSuccess.count,
        equals(0),
        reason: 'should not called',
      );

      expect(
        onFailure.count,
        equals(0),
        reason: 'should not called',
      );
      expect(
        onPending.count,
        equals(1),
        reason: 'should called once',
      );
    });
  });

  group('WhenAsyncFutureX', () {
    const data = 'hello';
    final tester = Stub.nullary<Future<Result<String>>>();
    final onSuccess = Stub.unary<Future<int>, String>()
      ..stub = (_) => Future.sync(() => 0);
    final onFailure = Stub.unary<Future<int>, Failure<String>>()
      ..stub = (_) => Future.sync(() => 0);
    final onPending = Stub.nullary<Future<int>>()
      ..stub = () => Future.sync(() => 0);

    setUp(() {
      onSuccess.reset();
      onFailure.reset();
      onPending.reset();
      tester.reset();
    });

    test('GIVEN ... ' 'WHEN is Success' 'THEN function is called', () async {
      tester.stub = () async => const Success(data);
      final result = tester();

      expect(
        await result.whenAsync(
          onSuccess: onSuccess,
          onFailure: onFailure,
          onPending: onPending,
        ),
        isA<int?>(),
        reason: 'should be correct',
      );

      expect(
        onSuccess.count,
        equals(1),
        reason: 'should called once',
      );

      expect(
        onFailure.count,
        equals(0),
        reason: 'should not called',
      );

      expect(
        onPending.count,
        equals(0),
        reason: 'should not called',
      );
    });

    test('GIVEN ... ' 'WHEN is Failure' 'THEN function is called', () async {
      tester.stub = () async => Failure();
      final result = tester();

      expect(
        await result.whenAsync(
          onSuccess: onSuccess,
          onFailure: onFailure,
          onPending: onPending,
        ),
        isA<int?>(),
        reason: 'should be correct',
      );

      expect(
        onSuccess.count,
        equals(0),
        reason: 'should not called',
      );

      expect(
        onFailure.count,
        equals(1),
        reason: 'should called once',
      );

      expect(
        onPending.count,
        equals(0),
        reason: 'should not called',
      );
    });
    test('GIVEN ... ' 'WHEN is Pending' 'THEN function is called', () async {
      tester.stub = () async => Pending();
      final result = tester();

      expect(
        await result.whenAsync(
          onSuccess: onSuccess,
          onFailure: onFailure,
          onPending: onPending,
        ),
        isA<int?>(),
        reason: 'should be correct',
      );

      expect(
        onSuccess.count,
        equals(0),
        reason: 'should not called',
      );

      expect(
        onFailure.count,
        equals(0),
        reason: 'should not called',
      );
      expect(
        onPending.count,
        equals(1),
        reason: 'should called once',
      );
    });
  });
}
