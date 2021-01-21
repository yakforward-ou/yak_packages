import 'package:riverpod/all.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/src/defs/all.dart';
import 'package:yak_error_handler/src/provider/all.dart';

void main() {
  group('`errorHandler` provider', () {
    test('WHEN `read(errorHandler)` THEN outputs `YakErrorHandler` `',
        () async {
      final container = ProviderContainer(overrides: []);
      final _handler = container.read(errorHandler);

      expect(
        _handler,
        isA<YakErrorHandler>(),
        reason: '`read(errorHandler)` should output YakErrorHandler',
      );
    });
  });
}
