import 'dart:async';

import 'package:yak_utils/yak_utils.dart' show Unary;
import '../classes/result.dart' show Result;
import '../classes/void_result.dart' show VoidResult;
import 'future_result.dart';

/// an unary function that returns a Result
typedef ResultUnary<T extends Object, S> = Unary<Result<T>, S>;

/// an unary async function that returns a Result
///! differs from  [UnaryAsync] ad it returns [FutureOr] instead of [Future]
typedef ResultUnaryAsync<T extends Object, S> = Unary<FutureResult<T>, S>;

/// an [Nullary] function that returns a [VoidResult]
typedef VoidResultUnary<T> = Unary<VoidResult, T>;

/// an [Nullary] [async] [Function] that returns a [VoidResult]
typedef VoidResultUnaryAsync<T> = Unary<FutureVoidResult, T>;
