import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

void main() {
  group('CacheNullaryX', () {
    late Nullary function;

    setUp(() {
      function = () {};
    });
    test(
        'GIVEN a function Nullary<T> '
        'WHEN function.cache '
        'THEN returns a Cache<T>', () {
      expect(
        function.cache,
        isA<Cache<void>>(),
        reason: 'should return a cache',
      );
    });
  });

  group('CacheNullaryAsyncX', () {
    late NullaryAsync function;

    setUp(() {
      function = () async {};
    });
    test(
        'GIVEN a function NullaryAsync<T> '
        'WHEN function.cache '
        'THEN returns a Cache<T>', () {
      expect(
        function.cache,
        isA<Cache<void>>(),
        reason: 'should return a cache',
      );
    });
  });

  group('CacheUnaryX', () {
    const arg = 0;
    late Unary<void, int> function;

    setUp(() {
      function = (p0) {};
    });
    test(
        'GIVEN a function Nullary<T> '
        'WHEN function.cache '
        'THEN returns a Cache<T>', () {
      expect(
        function.cache(arg),
        isA<Cache<void>>(),
        reason: 'should return a cache',
      );
    });
  });
  group('CacheUnaryAsyncX', () {
    const arg = 0;
    late UnaryAsync<void, int> function;

    setUp(() {
      function = (p0) async {};
    });
    test(
        'GIVEN a function NullaryAsync<T> '
        'WHEN function.cache '
        'THEN returns a Cache<T>', () {
      expect(
        function.cache(arg),
        isA<Cache<void>>(),
        reason: 'should return a cache',
      );
    });
  });
}
