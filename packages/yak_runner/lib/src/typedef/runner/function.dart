import 'dart:async';
import 'package:yak_result/yak_result.dart';

/// a typedef for a `Runner`
typedef RunnerFunction<T> = Result<T> Function();

/// a typedef for a `RunnerAsync`
typedef RunnerAsyncFunction<T> = Future<Result<T>> Function();

/// a typedef for a `UnaryRunner`
typedef UnaryRunnerFunction<T, S> = Result<T> Function(S);

/// a typedef for a `UnaryRunnerAsync`
typedef UnaryRunnerAsyncFunction<T, S> = Future<Result<T>> Function(
  FutureOr<S>,
);
