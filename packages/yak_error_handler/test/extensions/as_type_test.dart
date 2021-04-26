import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
// ignore_for_file: avoid_catching_errors

void main() {
  final handler = unaryStub<void, AsTypeError>()..stub = (_) {};
  const s = 0;
  group('AsTypeX test', () {
    test(
        'GIVEN `ErrorHandler<AsTypeError>`'
        'WHEN Error is AsTypeError'
        'THEN returns not null', () {
      handler.reset;
      AsTypeError? err;

      try {
        s.as<String>();
      } on Error catch (e) {
        err = handler.stub.handle(e);
      }

      expect(err != null, true, reason: 'should not be null');
    });
    test(
        'GIVEN `ErrorHandler<AvowError>`'
        'WHEN Error is AvowError'
        'THEN  calls ErrorHandler', () {
      handler.reset;
      try {
        s.as<String>();
      } on Error catch (e) {
        handler.stub.handle(e);
      }

      expect(handler.count, 1, reason: 'handler should be called');
    });
    test(
        'GIVEN `ErrorHandler<AvowError>`'
        'WHEN Error is  something else'
        'THEN returns  null', () {
      handler.reset;
      AsTypeError? err;

      try {
        assert(false);
      } on Error catch (e) {
        err = handler.stub.handle(e);
      }

      expect(err != null, false, reason: 'should  be null');
    });
    test(
        'GIVEN `ErrorHandler<AvowError>`'
        'WHEN Error is something else'
        'THEN  calls ErrorHandler', () {
      handler.reset;

      try {
        assert(false);
      } on Error catch (e) {
        handler.stub.handle(e);
      }

      expect(handler.count, 0, reason: 'handler should not be called');
    });
  });
}
