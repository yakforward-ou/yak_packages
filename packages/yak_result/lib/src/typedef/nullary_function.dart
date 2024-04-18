import 'package:yak_utils/yak_utils.dart' show Nullary;
import '../classes/result.dart' show Result;
import '../classes/void_result.dart' show VoidResult;
import 'future_result.dart';

/// an [Nullary] [Function] that returns a [Result]
typedef ResultNullary<T extends Object> = Nullary<Result<T>>;

/// an [Nullary] [async] [Function] that returns a [Result]
typedef ResultNullaryAsync<T extends Object> = Nullary<FutureResult<T>>;

/// an [Nullary] function that returns a [VoidResult]
typedef VoidResultNullary = Nullary<VoidResult>;

/// an [Nullary] [async] [Function] that returns a [VoidResult]
typedef VoidResultNullaryAsync = Nullary<FutureVoidResult>;
