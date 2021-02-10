import '../delegate/all.dart';

/// a `mixin` that allow to generate `YakRunnerTestDelegate`
/// of the same type `T` of the the class calling the function
mixin YakRunnerTestFactoryDelegate {
  /// `call` returns a `YakRunnerTestDelegate` of type `T`
  YakRunnerTestDelegate<T> call<T>();
}
