import 'dart:async';

import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

void main() {
  group('Cache', () {
    const value = 1;

    group('async', () {
      late Cache<int> tester;
      final generator = Stub.nullary<FutureOr<int>>()
        ..stub = () => Future.sync(() => 1);

      setUp(() {
        tester = Cache<int>(generator);
        generator.reset();
      });

      test(
          'GIVEN a Cache<T> '
          'WHEN is not initialized '
          'THEN ready returns false', () {
        expect(
          tester.ready,
          isFalse,
          reason: 'cache should not be ready',
        );
        expect(
          generator.count,
          isZero,
          reason: 'generator should not be called',
        );
      });
      test(
          'GIVEN a Cache<T> '
          'WHEN is not initialized '
          'THEN generator is not called', () {
        expect(
          generator.count,
          isZero,
          reason: 'generator should not be called',
        );
      });
      test(
          'GIVEN a Cache<T> '
          'WHEN is initialized '
          'THEN ready returns true', () async {
        await tester.initialize();
        expect(
          tester.ready,
          isTrue,
          reason: 'cache should not be ready',
        );
      });
      test(
          'GIVEN a Cache<T> '
          'WHEN is initialized '
          'THEN generator is called', () async {
        await tester.initialize();

        expect(
          generator.count,
          equals(1),
          reason: 'generator should be called once',
        );
      });
      test(
          'GIVEN a Cache<T> '
          'WHEN is initialized '
          'THEN "value" returns expected value', () async {
        await tester.initialize();
        expect(
          tester.value,
          equals(value),
          reason: 'value should be predictable',
        );
      });
      test(
          'GIVEN a Cache<T> '
          'WHEN is not initialized '
          'THEN "value" should throw', () {
        expect(
          () => tester.value,
          throwsException,
          reason: 'value should throw',
        );
      });
      test(
          'GIVEN a Cache<T> '
          'WHEN generator throws '
          'THEN initialization throws', () {
        generator.stub = () => throw Exception();
        expectLater(
          () async => await tester.initialize(),
          throwsException,
          reason: 'value should throw',
        );
      });
    });
  });
}
