import '../delegate/all.dart';

/// a `mixin` that allow to generate `RunnerTestDelegate`
/// of the same type `T` of the the class calling the function
mixin RunnerTestFactoryDelegate {
  /// `call` returns a `RunnerTestDelegate` of type `T`
  RunnerTestDelegate<T> call<T>();
}
