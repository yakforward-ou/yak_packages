import 'package:mockito/mockito.dart';
import 'package:riverpod/all.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/src/provider/all.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

import '../mocks/catch_error.dart';
import '../mocks/delegate.dart';

void main() {
  group('`handleError`', () {
    final container = ProviderContainer(overrides: []);
    final _setCatch = container.read(setCatchError);
    final _catch = container.read(catchError);
    final _delegate = MockDelegate();
    final _errorHandler = MockCatchError();
    _setCatch(_errorHandler);
    when(_errorHandler(any, any)).thenAnswer((_) {});

    test('WHEN `Delegate` throws THEN `Catch` should be triggered `', () {
      reset(_delegate);
      reset(_errorHandler);
      when(_delegate()).thenThrow('ops');

      try {
        _delegate();
      } catch (e, s) {
        _catch(e, s);
      }

      print('$_catch');
      verify(_delegate()).called(1);
      verify(_errorHandler(any, any)).called(1);
    });
    test('WHEN `Delegate` does not fail Then `Catch` should not be triggered',
        () {
      reset(_delegate);
      reset(_errorHandler);
      when(_delegate()).thenAnswer((_) {});

      try {
        _delegate();
      } catch (e, s) {
        _catch(e, s);
      }

      verify(_delegate()).called(1);
      verifyNever(_errorHandler(any, any));
    });
  });
}
