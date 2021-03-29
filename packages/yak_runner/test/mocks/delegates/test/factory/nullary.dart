import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockRunnerTestFactoryDelegate extends Stub<dynamic>
    implements RunnerTestFactoryDelegate {
  @override
  RunnerTestDelegate<T> call<T>() => stub();
}
