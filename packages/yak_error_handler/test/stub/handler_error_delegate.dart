import 'package:stub/stub.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

class HandleErrorDelegateStub<T extends Error> extends Stub<void>
    implements HandleExactErrorDelegate<T> {
  @override
  void call(T e) => stub();
}
