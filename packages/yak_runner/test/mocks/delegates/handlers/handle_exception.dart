import 'package:stub/stub.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

class HandleExceptionDelegateStub extends Stub<void>
    implements HandleExceptionDelegate {
  @override
  void call(Exception e, StackTrace? s) => stub();
}
