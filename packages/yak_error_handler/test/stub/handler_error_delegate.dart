import 'package:stub/stub.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

class MockHandleErrorDelegate<T extends Error>
    implements HandleExactErrorDelegate<T> {
  final stub = unaryStub<void, T>();
  @override
  void call(T e) => stub.wrap(e);
}
