import 'package:mockito/mockito.dart';
import 'function_interface.dart';

class YakAsyncFunctionInterfaceMock<T, S> extends Mock
    implements YakAsyncFunctionInterface<T, S> {}
