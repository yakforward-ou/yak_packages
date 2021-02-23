import 'package:mockito/mockito.dart';

mixin ExceptionHandler {
  void call(Exception e, StackTrace s);
}

class MockExceptionHandler extends Mock implements ExceptionHandler {}
