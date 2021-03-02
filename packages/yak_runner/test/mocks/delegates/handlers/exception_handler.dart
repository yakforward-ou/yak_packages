import 'package:mocktail/mocktail.dart';

mixin ExceptionHandler {
  void call(Object e, StackTrace? s);
}

class MockExceptionHandler extends Mock implements ExceptionHandler {}
