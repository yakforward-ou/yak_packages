import 'package:mocktail/mocktail.dart';
import 'package:yak_runner/yak_runner.dart';

class MockYakRunnerTestDelegate<T, S> extends Mock
    implements YakRunnerTestDelegate<T> {}
