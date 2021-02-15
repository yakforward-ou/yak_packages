import 'package:yak_runner/yak_runner.dart';

import '../test_delegate/nullary.dart';

class FakeNullaryTestFactory implements YakRunnerTestFactoryDelegate {
  const FakeNullaryTestFactory();
  @override
  YakRunnerTestDelegate<T> call<T>() => const FakeNullaryTest();
}
