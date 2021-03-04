import 'package:stub/stub.dart';

mixin ExceptionHandler {
  void call(Exception e, StackTrace? s);
}

class MockExceptionHandler extends Stub<void> implements ExceptionHandler {
  @override
  void call(Exception e, StackTrace? s) => stub.result;
}
