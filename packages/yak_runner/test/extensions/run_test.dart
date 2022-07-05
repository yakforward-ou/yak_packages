import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('RunNullarySyncX', () {
    test(
        'GIVEN a Nullary function '
        'WHEN nullary.run '
        'THEN returns a RunNullarySync', () {
      int function() => 42;
      expect(
        function.run,
        isA<RunNullarySync<int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('RunNullaryAsyncX', () {
    test(
        'GIVEN a NullaryAsync function '
        'WHEN function.run '
        'THEN returns a RunNullaryAsync', () {
      Future<int> function() async => 42;
      expect(
        function.run,
        isA<RunNullaryAsync<int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('RunUnarySyncX', () {
    test(
        'GIVEN a Unary function '
        'WHEN function.run '
        'THEN returns a RunUnarySync', () {
      int function(i) => i * 2;
      expect(
        function.run,
        isA<RunUnarySync<int, int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
  group('RunNullarySyncX', () {
    test(
        'GIVEN a UnaryAsync function '
        'WHEN function.run '
        'THEN returns a RunUnaryAsync', () {
      Future<int> function(i) async => i * 2;
      expect(
        function.run,
        isA<RunUnaryAsync<int, int>>(),
        reason: 'return type should be predictable',
      );
    });
  });
}
