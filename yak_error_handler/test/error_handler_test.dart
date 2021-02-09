import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

void main() {
  group('`YakErrorHandler`', () {
    void throwError() => throw 'ops';
    final errorList = [];
    final anotherErrorList = [];

    test('WHEN no `Catch` set THEN does not throw`', () {
      var err = 0;
      try {
        throwError();
      } catch (e, s) {
        try {
          YakErrorHandler()(e, s);
        } catch (_, __) {
          err++;
        }
      }

      expect(err < 1, true);
    });

    test('WHEN `function` throws THEN `handleError` should be triggered `', () {
      errorList.clear();
      YakErrorHandler()..handleError = (_, __) => errorList.add(0);

      try {
        throwError();
      } catch (e, s) {
        YakErrorHandler()(e, s);
      }

      expect(errorList, isNotEmpty,
          reason: '`handleError` should be triggered');
    });
    test(
        'WHEN `YakErrorHandler` is unchanged '
        'THEN should retain config across function`', () {
      errorList.clear();

      try {
        throwError();
      } catch (e, s) {
        YakErrorHandler()(e, s);
      }

      expect(errorList, isNotEmpty,
          reason: '`handleError` should be triggered');
      expect(errorList.length < 2, true,
          reason: 'make sure that list does not store value across test');
    });

    test(
        'WHEN `YakErrorHandler` `handleError` is changed '
        'THEN should updated `', () {
      errorList.clear();
      anotherErrorList.clear();

      try {
        throwError();
      } catch (e, s) {
        YakErrorHandler()(e, s);
      }

      YakErrorHandler()..handleError = (_, __) => anotherErrorList.add(0);

      try {
        throwError();
      } catch (e, s) {
        YakErrorHandler()(e, s);
      }

      expect(errorList, isNotEmpty,
          reason: '`handleError` should be triggered');
      expect(errorList.length < 2, true,
          reason: '`errorList` receive only one value');
      expect(anotherErrorList, isNotEmpty,
          reason: 'updated `handleError` should be triggered');
      expect(anotherErrorList.length < 2, true,
          reason: '`anotherErrorList` receive only one value');
    });
  });
}
