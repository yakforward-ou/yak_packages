import '../all.dart';

/// an nullary function that returns a Result
typedef ResultNullaryFunction<T> = Result<T> Function();

/// an nullary async function that returns a Result
typedef ResultNullaryFunctionAsync<T> = Future<Result<T>> Function();
