import 'package:mockito/mockito.dart';
import 'function_interface.dart';

class YakFunctionInterfaceMock<T, S> extends Mock
    implements YakFunctionInterface<T, S> {}
