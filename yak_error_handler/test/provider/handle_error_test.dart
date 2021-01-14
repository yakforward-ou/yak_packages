import 'package:riverpod/all.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

void main() {
  group('`handleError`', () {
    test('WHEN `read(errorHandler)` THEN outputs `Stream<YakError>` `',
        () async {
      final container = ProviderContainer(overrides: []);
      final _handleError = container.read(handleError);

      expect(
        _handleError,
        isA<Stream<YakError>>(),
        reason: '`handleError` should be a `Stream<YakError>`',
      );
    });
    test('WHEN error is thrown THEN `handleError` yield `YakError`', () async {
      final container = ProviderContainer(overrides: []);
      final _catchError = container.read(catchError);
      final _handleError = container.read(handleError);

      void _fun() => throw 'ops';

      try {
        _fun();
      } catch (e, s) {
        _catchError(e, s);
      }

      final _errors = [await for (final error in _handleError) error];

      expect(_errors.length, 1);
    });

    test('WHEN no is thrown THEN `handleError`', () async {
      final container = ProviderContainer(overrides: []);
      final _catchError = container.read(catchError);
      final _handleError = container.read(handleError);

      void _fun() {}

      try {
        _fun();
      } catch (e, s) {
        _catchError(e, s);
      }

      final _errors = [await for (final error in _handleError) error];

      expect(_errors.length, 0);
    });
  });
}
