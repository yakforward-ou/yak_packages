import 'package:stub/stub.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

/// a mock for `HandleExceptionDelegate`
class MockHandleExceptionDelegate implements HandleExceptionDelegate {
  /// the stub method for `HandleExceptionDelegate`
  final stub = unaryStub<void, List>();
  @override
  void call(Exception e, StackTrace? s) => stub.wrap([e, s]);
}
