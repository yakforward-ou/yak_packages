import 'package:test/test.dart';
import '../stub/all.dart';

void main() {
  group('`HandleErrorDelegate`', () {
    test(
        'WHEN `HandleErrorDelegate`'
        'THEN can be assigned as `void Function(Error)`'
        '', () {
      var succcess;
      final handler = HandleErrorDelegateStub()..result = () => succcess = true;
      late final void Function(Error e) fun;
      fun = handler;
      try {
        throw Error();
      } on Error catch (e) {
        fun(e);
      }
      expect(
        succcess,
        true,
        reason: 'the delegate can be pass at the equivalent function',
      );
    });
  });
}
