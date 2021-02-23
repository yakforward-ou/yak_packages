import 'package:test/test.dart';

import '../mocks/all.dart';

void main() {
  group('`HandleError`', () {
    test('WHEN T is `Error` THEN `AssertionError` is thrown', () {
      () => expect(
            () => MockHandleError<Error>(),
            throwsA(isA<AssertionError>()),
            reason: '`T is Error` should throw `AssertionError`',
          );
    });

    test('WHEN `HandleError.type` THEN `matches `T`', () {
      () {
        final subj = MockHandleError<AssertionError>();
        expect(
          subj.type,
          isA<AssertionError>(),
          reason: '`T should match `HandleError.type`',
        );
      };
    });
  });
}
