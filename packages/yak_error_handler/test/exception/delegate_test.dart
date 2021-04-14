import 'package:test/test.dart';
import '../stub/all.dart';

void main() {
  group('`HandleExceptionDelegate`', () {
    test(
        'WHEN `HandleExceptionDelegate`'
        'THEN can be assigned as `void Function(Exception,StackTrace)`'
        '', () {
      final mock = MockHandleExceptionDelegate()..stub.stub = (_) {};
      final void Function(Exception e, StackTrace s) fun = mock;
      try {
        throw Exception();
      } on Exception catch (e, s) {
        fun(e, s);
      }
      expect(
        mock.stub.count,
        1,
        reason: 'HandleExceptionDelegate function is called',
      );
    });
  });
}
