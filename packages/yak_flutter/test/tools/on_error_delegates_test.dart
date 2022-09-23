import 'package:flutter_test/flutter_test.dart';
import 'package:stub/stub.dart';
import 'package:yak_flutter/yak_flutter.dart';

void main() {
  group('OnErroDoNothing', () {
    test(
      'GIVEN ... '
      ' WHEN OnErroDoNothing instance '
      'THEN is a OnErroDelegate ',
      () {
        const tester = OnErroDoNothing();
        expect(
          tester,
          isA<OnErrorDelegate>(),
          reason: 'type should be predictable',
        );
      },
    );
  });
  group('OnErrorPrint', () {
    test(
      'GIVEN ... '
      ' WHEN OnErrorPrint instance '
      'THEN is a OnErroDelegate ',
      () {
        const tester = OnErrorPrint();
        expect(
          tester,
          isA<OnErrorDelegate>(),
          reason: 'type should be predictable',
        );
      },
    );
  });

  group('RecordError', () {
    final function = Stub.unary<void, Failure>()..stub = (_) {};

    setUp(function.reset);
    test(
      'GIVEN RecordError onError is set'
      'WHEN RecordError.call() '
      'THEN the onError is called ',
      () {
        final tester = RecordError()
          ..onError = (e, s) => function(
                Failure(reason: e, stackTrace: s),
              );

        tester(null, null);

        expect(
          function.count == 1,
          isTrue,
          reason: 'type should be predictable',
        );
      },
    );
  });
}
