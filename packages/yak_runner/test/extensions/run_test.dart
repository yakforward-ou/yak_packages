import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ResultNullaryX', () {
    test(
        'GIVEN a Nullary function '
        'WHEN nullary.run '
        'THEN returns a ResultNullary', () {
      int function() => 42;
      expect(
        function.run,
        isA<ResultNullary<int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('ResultNullaryAsyncX', () {
    test(
        'GIVEN a NullaryAsync function '
        'WHEN function.run '
        'THEN returns a ResultNullaryAsync', () {
      Future<int> function() async => 42;
      expect(
        function.run,
        isA<ResultNullaryAsync<int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('ResultUnaryX', () {
    test(
        'GIVEN a Unary function '
        'WHEN function.run '
        'THEN returns a ResultUnary', () {
      int function(i) => i * 2;
      expect(
        function.run,
        isA<ResultUnary<int, int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('ResultNullaryX', () {
    test(
        'GIVEN a UnaryAsync function '
        'WHEN function.run '
        'THEN returns a ResultUnaryAsync', () {
      Future<int> function(i) async => i * 2;
      expect(
        function.run,
        isA<ResultUnaryAsync<int, int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
}
