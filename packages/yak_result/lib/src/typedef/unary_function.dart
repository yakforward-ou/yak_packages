import 'dart:async';
import 'package:yak_utils/yak_utils.dart' show Unary;

import '../all.dart';

/// an unary function that returns a Result
typedef ResultUnaryFunction<T, S> = Unary<Result<T>, S>;

/// an unary async function that returns a Result
typedef ResultUnaryFunctionAsync<T, S> = Unary<Future<Result<T>>, S>;
