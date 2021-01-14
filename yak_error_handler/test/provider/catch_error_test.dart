import 'package:riverpod/all.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/src/typedef/all.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

void main() {
  group('`errorHandler` provider', () {
    test('WHEN `read(catchError)` THEN outputs typedef `Catch` `', () async {
      final container = ProviderContainer(overrides: []);
      final _catchError = container.read(catchError);

      expect(
        _catchError,
        isA<Catch>(),
        reason: '`read(catchError)` should output `Catch`',
      );
    });
  });
}
