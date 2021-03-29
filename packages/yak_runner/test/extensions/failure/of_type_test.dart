import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

class _StackTrace extends StackTrace {}

void main() {
  final e = AvowError();
  final s = _StackTrace();
  group('`FailureToFailureOfTypeX`', () {
    test(
        'Given Failure<S>'
        'WHEN ofType<T>() '
        'THEN return  Failure<T>', () {
      final f = Failure<String>(e, s);
      final f2 = f.ofType<int>();
      expect(
        f2,
        isA<Failure<int>>(),
        reason: ' Failure<S>()asType<T>() should be a Failure<T>',
      );

      expect(
        f.e == f2.e,
        true,
        reason: '`Object e should be preserved`',
      );

      expect(
        f.s == f2.s,
        true,
        reason: '`StackTrace s should be preserved`',
      );
    });
  });
}
