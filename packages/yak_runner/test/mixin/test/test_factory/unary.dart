import 'package:yak_runner/yak_runner.dart';

import '../test_delegate/unary.dart';

class FakeUnaryTestFactory implements YakRunnerArgTestFactoryDelegate {
  const FakeUnaryTestFactory();
  @override
  YakRunnerArgTestDelegate<T, S> call<T, S>() => const FakeUnaryTest();
}
