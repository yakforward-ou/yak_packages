import '../../all.dart';

/// a `mixin` on `RunnerBase`
mixin RunnerTestMixin<T> on RunnerBase<T> {
  /// is a `RunnerTestDelegate Function(RunnerTestFactoryDelegate)`
  /// type `T` is passed by the `Object` to the test to `RunnerTestDelegate`
  RunnerTestDelegate<T> buildTest(RunnerTestFactoryDelegate testFactory) =>
      testFactory<T>();
}
