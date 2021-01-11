import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';

class MockYakRunnerTestDelegate<T, S> extends Mock
    implements YakRunnerTestDelegate<T> {}
