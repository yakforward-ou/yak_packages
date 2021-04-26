import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`FailureToFailureOfTypeX`', () {
    test(
        'Given Failure<S>'
        'WHEN ofType<T>() '
        'THEN return  Failure<T>', () {
      final f = Failure<String>(ErrorReport());
      final f2 = f.ofType<int>();
      expect(
        f2,
        isA<Failure<int>>(),
        reason: ' Failure<S>()asType<T>() should be a Failure<T>',
      );

      expect(
        f.report.message == f2.report.message,
        true,
        reason: '`Object e should be preserved`',
      );

      expect(
        f.report.stackTrace == f2.report.stackTrace,
        true,
        reason: '`StackTrace s should be preserved`',
      );
    });
  });
}
