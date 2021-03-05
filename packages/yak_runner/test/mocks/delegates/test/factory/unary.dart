import 'package:stub/stub.dart';
import 'package:yak_runner/yak_runner.dart';

class MockYakRunnerArgTestFactoryDelegate extends Stub<dynamic>
    implements YakRunnerArgTestFactoryDelegate {
  @override
  YakRunnerArgTestDelegate<T, S> call<T, S>() => stub();
}
