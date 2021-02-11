import '../../delegates/all.dart';

/// a `mixin` on `Object`
mixin YakRunnerArgTestMixin<T, S> {
  /// is a `YakRunnerTestDelegate Function(YakRunnerTestFactoryDelegate)`
  /// types `T` & `S` are passed by the `Object`
  /// to the test to `YakRunnerTestDelegate`
  YakRunnerArgTestDelegate<T, S> buildTest(
          YakRunnerArgTestFactoryDelegate testFactory) =>
      testFactory<T, S>();
}
