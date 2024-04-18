import 'dart:async';

import '../classes/result.dart' show Result;
import '../classes/void_result.dart' show VoidResult;

/// a [FutureOr] [Result]
typedef FutureResult<T extends Object> = FutureOr<Result<T>>;

/// a [FutureOr] [VoidResult]
typedef FutureVoidResult = FutureOr<VoidResult>;
