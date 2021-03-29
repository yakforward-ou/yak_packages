import 'package:yak_runner/yak_runner.dart';

import '../test_delegate/unary.dart';

class FakeUnaryTestFactory implements UnaryRunnerTestFactoryDelegate {
  const FakeUnaryTestFactory();
  @override
  UnaryRunnerTestDelegate<T, S> call<T, S>() => const FakeUnaryTest();
}
