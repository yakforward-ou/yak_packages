import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`HandleErrorFromErrorExtension`', () {
    test(
      'WHEN `T extends Error` & `T.handle()` THEN returns `HandleError<T>`',
      () => expect(
        AssertionError().handle((_) {}),
        isA<HandleError<AssertionError>>(),
        reason: '`HandleError.ignore()` should be `HandleError`',
      ),
    );

    test(
      'WHEN `T extends Error` & `T.ignore` THEN returns `HandleError<T>`',
      () => expect(
        AssertionError().ignore,
        isA<HandleError<AssertionError>>(),
        reason: '`HandleError.ignore()` should be `HandleError`',
      ),
    );
  });
}
