import 'package:mockito/mockito.dart';

mixin ErrorHandler {
  void call(Object e, StackTrace s);
}

class MockErrorHandler extends Mock implements ErrorHandler {}
