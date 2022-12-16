import 'package:yak_result/yak_result.dart'
    show
        VoidResultNullaryAsync,
        VoidResultNullary,
        VoidResultUnaryAsync,
        VoidResultUnary;
import 'package:yak_utils/yak_utils.dart'
    show
        NullaryDelegate,
        NullaryDelegateAsync,
        UnaryDelegate,
        UnaryDelegateAsync;

import '../all.dart';

/// equivalent of [ResultNullaryAsyncCallbackX]
/// targeting [NullaryDelegateAsync] instead of [NullaryAsync]
extension ResultNullaryDelegateAsyncX<T> on NullaryDelegateAsync<T> {
  VoidResultNullaryAsync get callback => runCallbackAsync<T>(this);
}

/// equivalent of [ResultNullaryCallbackX]
/// targeting [NullaryDelegate] instead of [Nullary]
extension ResultNullaryCallbackDelegateX<T> on NullaryDelegate<T> {
  VoidResultNullary get callback => runCallback<T>(this);
}

/// equivalent of [ResultUnaryAsyncCallbackX]
/// targeting [UnaryDelegateAsync] instead of [UnaryAsync]
extension ResultUnaryAsyncDelegateX<T, S> on UnaryDelegateAsync<T, S> {
  VoidResultUnaryAsync<S> get callback => runUnaryCallbackAsync<T, S>(this);
}

/// equivalent of [ResultUnaryCallbackX]
/// targeting [UnaryDelegate] instead of [Unary]
extension ResultUnaryDelegateX<T, S> on UnaryDelegate<T, S> {
  VoidResultUnary<S> get callback => runUnaryCallback<T, S>(this);
}
