import 'package:mockito/mockito.dart';

import 'handle_exception_delegate.dart';

/// a `mockito` based `Mock` for ` void Function(Exception, StackTrace)`
class MockExceptionHandler extends Mock implements ExceptionHandler {}
