import '../delegate/all.dart';

/// a `mixin` that allow to generate `RunnerTestDelegate`
/// of the same types `T` & `S` of the the class calling the function
mixin UnaryRunnerTestFactoryDelegate {
  /// `call` returns a `UnaryRunnerTestDelegate` with types `T` &  `S`
  UnaryRunnerTestDelegate<T, S> call<T, S>();
}
