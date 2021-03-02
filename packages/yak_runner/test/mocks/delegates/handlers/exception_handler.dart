import 'package:mocktail/mocktail.dart';

mixin ExceptionHandler {
  void call(Exception e, StackTrace? s);
}

class MockExceptionHandler extends Mock implements ExceptionHandler {}
