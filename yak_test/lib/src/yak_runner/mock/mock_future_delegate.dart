import 'package:yak_runner/yak_runner.dart';
import 'package:mockito/mockito.dart';

/// a simple `Mock` class made with `mockito` package to mock `FutureDelegate`

class MockFutureDelegate<T> extends Mock implements FutureDelegate<T> {}
