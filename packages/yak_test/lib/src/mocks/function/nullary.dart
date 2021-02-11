import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';

/// a `mockito` based `Mock` for a `nullary` function`
class MockDelegate<T> extends Mock implements Delegate<T> {}
