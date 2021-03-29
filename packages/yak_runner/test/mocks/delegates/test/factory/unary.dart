import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockUnaryRunnerTestFactoryDelegate extends Stub<dynamic>
    implements UnaryRunnerTestFactoryDelegate {
  @override
  UnaryRunnerTestDelegate<T, S> call<T, S>() => stub();
}
