import 'package:yak_utils/yak_utils.dart' show Nullary;

import '../all.dart';

/// an nullary function that returns a Result
typedef ResultNullaryFunction<T> = Nullary<Result<T>>;

/// an nullary async function that returns a Result
typedef ResultNullaryFunctionAsync<T> = Nullary<Future<Result<T>>>;
