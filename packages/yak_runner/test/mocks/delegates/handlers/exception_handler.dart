import 'package:mockito/mockito.dart';

mixin ExceptionHandler {
  void call(Object e, StackTrace? s);
}

class MockExceptionHandler extends Mock implements ExceptionHandler {}
