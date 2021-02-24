import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`YakRunnerTypeAsTypeExtension`', () {
    test('WHEN `S` asType<T> returns `Result<T>`', () {
      expect(
        'hello'.asType<int>(),
        isA<Result<int>>(),
        reason: '`S.asType<T>` should be `Result<T>`',
      );
    });
  });
}
