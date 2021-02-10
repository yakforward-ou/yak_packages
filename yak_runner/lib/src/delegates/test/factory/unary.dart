import '../delegate/all.dart';

/// a `mixin` that allow to generate `YakRunnerTestDelegate`
/// of the same types `T` & `S` of the the class calling the function
mixin YakRunnerArgTestFactoryDelegate {
  /// `call` returns a `YakRunnerArgTestDelegate` with types `T` &  `S`
  YakRunnerArgTestDelegate<T, S> call<T, S>();
}
