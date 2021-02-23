import '../../all.dart';

/// a `mixin` on `YakRunnerBase`
mixin YakRunnerTestMixin<T> on YakRunnerBase {
  /// is a `YakRunnerTestDelegate Function(YakRunnerTestFactoryDelegate)`
  /// type `T` is passed by the `Object` to the test to `YakRunnerTestDelegate`
  YakRunnerTestDelegate<T> buildTest(
          YakRunnerTestFactoryDelegate testFactory) =>
      testFactory<T>();
}
