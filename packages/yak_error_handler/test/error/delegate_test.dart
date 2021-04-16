import 'package:test/test.dart';
import '../stub/handler_error_delegate.dart';

void main() {
  group('`HandleErrorDelegate`', () {
    test(
        'WHEN `HandleErrorDelegate`'
        'THEN can be assigned as `void Function(Error)`', () {
      final mock = MockHandleErrorDelegate()..stub.stub = (e) {};
      final void Function(Error e) fun = mock;
      try {
        throw Error();
      } on Error catch (e) {
        fun(e);
      }
      expect(
        mock.stub.count,
        1,
        reason: 'HandleErrorDelegate function is called',
      );
    });
  });
}
