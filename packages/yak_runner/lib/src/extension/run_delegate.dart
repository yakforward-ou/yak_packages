import 'package:yak_result/yak_result.dart'
    show ResultNullaryAsync, ResultNullary, ResultUnaryAsync, ResultUnary;
import 'package:yak_utils/yak_utils.dart'
    show
        NullaryDelegate,
        NullaryDelegateAsync,
        UnaryDelegate,
        UnaryDelegateAsync;

import '../all.dart';

/// equivalent of [ResultNullaryX]
/// targeting [NullaryDelegate] instead of [Nullary]
extension ResultNullaryDelegateSyncX<T> on NullaryDelegate<T> {
  ResultNullary<T> get run => runNullary<T>(this);
}

/// equivalent of [ResultNullaryAsyncX]
/// targeting [NullaryDelegateAsync] instead of [NullaryAsync]
extension ResultNullaryDelegateAsyncX<T> on NullaryDelegateAsync<T> {
  ResultNullaryAsync<T> get run => runNullaryAsync<T>(this);
}

/// equivalent of [ResultUnaryX]
/// targeting [UnaryDelegate] instead of [Unary]
extension ResultUnaryDelegateX<T, S> on UnaryDelegate<T, S> {
  ResultUnary<T, S> get run => runUnary<T, S>(this);
}

/// equivalent of [ResultUnaryAsyncX]
/// targeting [UnaryDelegateAsync] instead of [UnaryAsync]
extension ResultUnaryAsyncDelegateX<T, S> on UnaryDelegateAsync<T, S> {
  ResultUnaryAsync<T, S> get run => runUnaryAsync<T, S>(this);
}
