import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ResultNullaryCallbackX', () {
    test(
        'GIVEN a Nullary function '
        'WHEN nullary.callback '
        'THEN returns a VoidResultNullary', () {
      int function() => 42;
      expect(
        function.callback,
        isA<VoidResultNullary>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('ResultNullaryCallbackX', () {
    test(
        'GIVEN a NullaryAsync function '
        'WHEN function.callback '
        'THEN returns a VoidResultNullaryAsync', () {
      Future<int> function() => Future.sync(() => 42);
      expect(
        function.callback,
        isA<VoidResultNullaryAsync>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('ResultUnaryX', () {
    test(
        'GIVEN a Unary function '
        'WHEN function.callback '
        'THEN returns a VoidResultUnary', () {
      int function(i) => i * 2;
      expect(
        function.callback,
        isA<VoidResultUnary<int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('ResultNullaryX', () {
    test(
        'GIVEN a UnaryAsync function '
        'WHEN function.callback '
        'THEN returns a VoidResultUnaryAsync', () {
      Future<int> function(i) => Future.sync(() => i * 2);
      expect(
        function.callback,
        isA<VoidResultUnaryAsync<int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
}
