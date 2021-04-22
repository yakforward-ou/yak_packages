import '../../all.dart';

/// a `mixin` on `RunnerBase`
mixin UnaryRunnerTestMixin<T, S> on RunnerBase<T> {
  /// is a `RunnerTestDelegate Function(RunnerTestFactoryDelegate)`
  /// types `T` & `S` are passed by the `Object`
  /// to the test to `RunnerTestDelegate`
  UnaryRunnerTestDelegate<T, S> buildTest(
          UnaryRunnerTestFactoryDelegate testFactory) =>
      testFactory<T, S>();
}
