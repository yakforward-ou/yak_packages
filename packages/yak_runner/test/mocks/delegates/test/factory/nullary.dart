import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockRunnerTestFactoryDelegate implements RunnerTestFactoryDelegate {
  final stub = nullaryStub<Object>();
  @override
  RunnerTestDelegate<T> call<T>() => stub.wrap() as RunnerTestDelegate<T>;
}
