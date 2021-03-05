import 'package:test/test.dart';
import '../stub/all.dart';

void main() {
  group('`HandleExceptionDelegate`', () {
    test(
        'WHEN `HandleExceptionDelegate`'
        'THEN can be assigned as `void Function(Exception,StackTrace)`'
        '', () {
      var succcess;
      final handler = HandleExceptionDelegateStub()
        ..result = () => succcess = true;
      late final void Function(Exception e, StackTrace s) fun;
      fun = handler;
      try {
        throw Exception();
      } on Exception catch (e, s) {
        fun(e, s);
      }
      expect(
        succcess,
        true,
        reason: 'the delegate can be pass at the equivalent function',
      );
    });
  });
}
