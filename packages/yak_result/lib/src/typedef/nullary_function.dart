import 'package:yak_utils/yak_utils.dart' show Nullary, NullaryAsync;

import '../all.dart';

/// an nullary function that returns a Result
typedef ResultNullary<T> = Nullary<Result<T>>;

/// an nullary async function that returns a Result
typedef ResultNullaryAsync<T> = NullaryAsync<Result<T>>;
