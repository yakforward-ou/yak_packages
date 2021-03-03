import 'package:meta/meta.dart';

import '../../stub.dart';

/// an interface for the `Stub` class
abstract class StubBase<T> {
  /// a `late` initialization for `T Function()`
  late T Function()? result;

  /// and `internal` counter fot the calls at the "stubbed" function
  @internal
  int callCountInternal;

  /// `stub` runs the function `result`
  /// and updates `callCountInternal`
  @internal
  StubResult<T> get stub;

  /// provides a `const` constructor
  StubBase() : callCountInternal = 0;

  /// provides the number of times the "stubbed" function has been called
  int get callCount => callCountInternal;
}
