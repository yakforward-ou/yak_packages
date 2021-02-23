import '../../all.dart';

/// a `mixin` on `YakRunnerBase`
mixin YakRunnerArgTestMixin<T, S> on YakRunnerBase {
  /// is a `YakRunnerTestDelegate Function(YakRunnerTestFactoryDelegate)`
  /// types `T` & `S` are passed by the `Object`
  /// to the test to `YakRunnerTestDelegate`
  YakRunnerArgTestDelegate<T, S> buildTest(
          YakRunnerArgTestFactoryDelegate testFactory) =>
      testFactory<T, S>();
}
