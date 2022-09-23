import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

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

  group('RecordError', () {
    final function = Stub.unary<void, Union>()..stub = (_) {};

    setUp(function.reset);
    test(
      'GIVEN RecordError onError is set'
      'WHEN RecordError.call() '
      'THEN the onError is called ',
      () {
        final tester = RecordError()..onError = (e, s) => function(Union(e, s));

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
