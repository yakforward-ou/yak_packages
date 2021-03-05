import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockYakRunnerTestFactoryDelegate extends Stub<dynamic>
    implements YakRunnerTestFactoryDelegate {
  @override
  YakRunnerTestDelegate<T> call<T>() => stub();
}
