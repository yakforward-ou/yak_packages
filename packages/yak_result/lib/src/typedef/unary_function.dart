import 'package:yak_utils/yak_utils.dart' show Unary, UnaryAsync;

import '../all.dart';

/// an unary function that returns a Result
typedef ResultUnary<T, S> = Unary<Result<T>, S>;

/// an unary async function that returns a Result
typedef ResultUnaryAsync<T, S> = UnaryAsync<Result<T>, S>;
