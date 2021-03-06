import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

void main() {
  group('`HandleErrorFromErrorExtension`', () {
    test(
      'WHEN `T extends Error` & `T.handle()` THEN returns `HandleError<T>`',
      () => expect(
        AssertionError().handle((_) {}),
        isA<ErrorHandler<AssertionError>>(),
        reason: '`HandleError.ignore()` should be `HandleError`',
      ),
    );

    test(
      'WHEN `T extends Error` & `T.ignore` THEN returns `HandleError<T>`',
      () => expect(
        AssertionError().ignore,
        isA<ErrorHandler<AssertionError>>(),
        reason: '`HandleError.ignore()` should be `HandleError`',
      ),
    );
  });
}
