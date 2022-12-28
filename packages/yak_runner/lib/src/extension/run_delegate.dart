import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

/// equivalent of [ResultNullaryX]
/// targeting [NullaryDelegate] instead of [Nullary]
extension ResultNullaryDelegateSyncX<T> on NullaryDelegate<T> {
  ResultNullary<T> get run => runNullary<T>(this);
}

/// equivalent of [ResultNullaryAsyncX]
/// targeting [NullaryDelegateAsync] instead of [NullaryAsync]
extension ResultNullaryDelegateAsyncX<T> on NullaryDelegateFutureOr<T> {
  ResultNullaryAsync<T> get runAsync => runNullaryAsync<T>(this);
}

/// equivalent of [ResultUnaryX]
/// targeting [UnaryDelegate] instead of [Unary]
extension ResultUnaryDelegateX<T, S> on UnaryDelegate<T, S> {
  ResultUnary<T, S> get run => runUnary<T, S>(this);
}

/// equivalent of [ResultUnaryAsyncX]
/// targeting [UnaryDelegateAsync] instead of [UnaryAsync]
extension ResultUnaryAsyncDelegateX<T, S> on UnaryDelegateFutureOr<T, S> {
  ResultUnaryAsync<T, S> get runAsync => runUnaryAsync<T, S>(this);
}
