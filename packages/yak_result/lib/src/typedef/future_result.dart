import 'dart:async';

import '../all.dart';

/// a [FutureOr] [Result]
typedef FutureResult<T> = FutureOr<Result<T>>;

/// a [FutureOr] [ValueResult]
typedef FutureValueResult<T> = FutureOr<ValueResult<T>>;

/// a [FutureOr] [VoidResult]
typedef FutureVoidResult = FutureOr<VoidResult<void>>;
