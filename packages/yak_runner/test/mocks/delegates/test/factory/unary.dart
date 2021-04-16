import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockUnaryRunnerTestFactoryDelegate
    implements UnaryRunnerTestFactoryDelegate {
  final stub = nullaryStub<Object>();

  @override
  UnaryRunnerTestDelegate<T, S> call<T, S>() =>
      stub.wrap() as UnaryRunnerTestDelegate<T, S>;
}
