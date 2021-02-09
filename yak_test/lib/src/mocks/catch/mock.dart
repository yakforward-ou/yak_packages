import 'package:mockito/mockito.dart';
import 'delegate.dart';

/// a `mockito` based `Mock` for ` void Function(Object, StackTrace)`

class MockCatch extends Mock implements CatchDelegate {}
