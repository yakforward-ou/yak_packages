import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

/// equivalent of [ResultNullaryAsyncCallbackX]
/// targeting [NullaryDelegateAsync] instead of [NullaryAsync]
extension RunCallbackNullaryDelegateAsyncX<T> on NullaryDelegateAsync<T> {
  VoidResultNullaryAsync get callbackAsync => runCallbackAsync<T>(this);
}

/// equivalent of [ResultNullaryCallbackX]
/// targeting [NullaryDelegate] instead of [Nullary]
extension RunCallbackNullaryDelegateX<T> on NullaryDelegate<T> {
  VoidResultNullary get callback => runCallback<T>(this);
}

/// equivalent of [ResultUnaryAsyncCallbackX]
/// targeting [UnaryDelegateAsync] instead of [UnaryAsync]
extension RunCallbackUnaryAsyncDelegateX<T, S> on UnaryDelegateAsync<T, S> {
  VoidResultUnaryAsync<S> get callbackAsync =>
      runUnaryCallbackAsync<T, S>(this);
}

/// equivalent of [ResultUnaryCallbackX]
/// targeting [UnaryDelegate] instead of [Unary]
extension RunCallbackUnaryDelegateX<T, S> on UnaryDelegate<T, S> {
  VoidResultUnary<S> get callback => runUnaryCallback<T, S>(this);
}
