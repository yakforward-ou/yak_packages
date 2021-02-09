import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';

/// a `mockito` based `Mock` for a `unary` function`

class MockUnaryDelegate<T, S> extends Mock implements UnaryDelegate<T, S> {}
