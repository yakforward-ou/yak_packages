import 'package:yak_runner/yak_runner.dart';

import '../test_delegate/nullary.dart';

class FakeNullaryTestFactory implements RunnerTestFactoryDelegate {
  const FakeNullaryTestFactory();
  @override
  RunnerTestDelegate<T> call<T>() => const FakeNullaryTest();
}
