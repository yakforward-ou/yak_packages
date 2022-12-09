import 'dart:async';

import 'package:yak_utils/yak_utils.dart' show Unary;

import '../all.dart';

/// an unary function that returns a Result
typedef ResultUnary<T, S> = Unary<ValueResult<T>, S>;

/// an unary async function that returns a Result
///! differs from  [UnaryAsync] ad it returns [FutureOr] instead of [Future]
typedef ResultUnaryAsync<T, S> = Unary<FutureOr<ValueResult<T>>, S>;

/// an [Nullary] function that returns a [VoidResult]
typedef VoidResultUnary<T> = Unary<VoidResult<void>, T>;

/// an [Nullary] [async] [Function] that returns a [VoidResult]
typedef VoidResultUnaryAsync<T> = Unary<FutureOr<VoidResult<void>>, T>;
