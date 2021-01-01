import 'package:yak_runner/yak_runner.dart';
import 'package:mockito/mockito.dart';

/// a simple `Mock` class made with `mockito` package to mock `ArgDelegate`

class MockArgDelegate<T, S> extends Mock implements ArgDelegate<T, S> {}
