import 'dart:async';

import '../../../yak_runner.dart';

/// a typedef for a `Runner`
typedef RunnerBuilder<T, S> = RunnerFunction<T> Function(S);

/// a typedef for a `RunnerAsync`
typedef RunnerBuilderAsync<T, S> = RunnerAsyncFunction<T> Function(FutureOr<S>);

/// a typedef for a `UnaryRunner`
typedef UnaryRunnerBuilder<T, S, Z> = UnaryRunnerFunction<T, S> Function(Z);

/// a typedef for a `UnaryRunnerAsync`
typedef UnaryRunnerBuilderAsync<T, S, Z> = UnaryRunnerAsyncFunction<T, S>
    Function(FutureOr<Z>);
