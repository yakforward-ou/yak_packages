import 'package:mockito/mockito.dart';
import 'package:riverpod/all.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../shared/all.dart';

class YakErrorHandlerTest {
  void call() {
    group('`YakErrorHandler` integration with `YakRunner`', () {
      /// see issue `https://github.com/rrousselGit/river_pod/issues/279`
      // final container = ProviderContainer();
      // final _handleError = container.read(handleError);
      // final _catchError = container.read(catchError);
      // final _delegate = MockDelegate<void>();
      // final _runner = YakRunner<void>(_delegate, _catchError);

      test(
          'WHEN `YakRunner` `Result` is `Failure` THEN `YakErrorHandler` streams a `YakError`',
          () async {
        final _container = ProviderContainer();
        final _handleError = _container.read(handleError);
        final _catchError = _container.read(catchError);
        final _delegate = MockDelegate<void>();
        final _runner = YakRunner<void>(_delegate, _catchError);
        reset(_delegate);
        when(_delegate()).thenThrow('ops');

        final _result = _runner();

        expect(
          _result,
          isA<Failure>(),
          reason: '`_result` should be `Failure`',
        );

        final _errors = [await for (final error in _handleError) error];

        expect(_errors.length, 1,
            reason: 'a `YakError` should be streamed by `handleError`');
      });
      test(
          'WHEN `YakRunner` `Result` is `Success` THEN `YakErrorHandler` does not stream anything`',
          () async {
        final _container = ProviderContainer();
        final _handleError = _container.read(handleError);
        final _catchError = _container.read(catchError);
        final _delegate = MockDelegate<void>();
        final _runner = YakRunner<void>(_delegate, _catchError);
        reset(_delegate);
        when(_delegate()).thenAnswer((_) {});

        final _result = _runner();

        expect(
          _result,
          isA<Success>(),
          reason: '`_result` should be `Success`',
        );

        final _errors = [await for (final error in _handleError) error];

        expect(_errors.length, 0,
            reason: '`handleError` should not stream anything');
      });
    });
  }
}
