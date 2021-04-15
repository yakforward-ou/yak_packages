import 'package:stub/stub.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

class MockHandleExceptionDelegate implements HandleExceptionDelegate {
  final stub = unaryStub<void, List>();
  @override
  void call(Exception e, StackTrace s) => stub.wrap([e, s]);
}
