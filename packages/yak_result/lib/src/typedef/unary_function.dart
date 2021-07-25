import 'dart:async';

import '../all.dart';

/// an unary function that returns a Result
typedef ResultUnaryFunction<T, S> = Result<T> Function(S);

/// an unary async function that returns a Result
typedef ResultUnaryFunctionAsync<T, S> = Future<Result<T>> Function(S);
