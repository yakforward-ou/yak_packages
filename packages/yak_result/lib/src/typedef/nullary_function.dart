import 'dart:async';
import 'package:yak_utils/yak_utils.dart' show Nullary;

import '../all.dart';

/// an [Nullary] [Function] that returns a [Result]
typedef ResultNullary<T> = Nullary<ValueResult<T>>;

/// an [Nullary] [async] [Function] that returns a [Result]
typedef ResultNullaryAsync<T> = Nullary<FutureOr<ValueResult<T>>>;

/// an [Nullary] function that returns a [VoidResult]
typedef VoidResultNullary = Nullary<VoidResult<void>>;

/// an [Nullary] [async] [Function] that returns a [VoidResult]
typedef VoidResultNullaryAsync = Nullary<FutureOr<VoidResult<void>>>;
