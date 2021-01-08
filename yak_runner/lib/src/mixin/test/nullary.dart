import 'package:yak_runner/src/delegates/all.dart';

mixin YakRunnerTestMixin<T> {
  YakRunnerTestDelegate<T> buildTest(
          YakRunnerTestFactoryDelegate testFactory) =>
      testFactory<T>();
}
