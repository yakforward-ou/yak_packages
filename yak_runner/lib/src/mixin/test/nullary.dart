import '../../delegates/all.dart';

/// a `mixin` on `Object`
mixin YakRunnerTestMixin<T> {
  /// is a `YakRunnerTestDelegate Function(YakRunnerTestFactoryDelegate)`
  /// type `T` is passed by the `Object` to the test to `YakRunnerTestDelegate`
  YakRunnerTestDelegate<T> buildTest(
          YakRunnerTestFactoryDelegate testFactory) =>
      testFactory<T>();
}
