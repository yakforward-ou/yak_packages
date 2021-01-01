import 'package:yak_runner/yak_runner.dart';
import 'package:mockito/mockito.dart';

/// a simple `Mock` class made with `mockito` package to mock `FutureArgDelegate`

class MockFutureArgDelegate<T, S> extends Mock
    implements FutureArgDelegate<T, S> {}
