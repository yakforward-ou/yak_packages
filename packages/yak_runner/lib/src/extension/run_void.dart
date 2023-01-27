import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';

import '../runner/void/all.dart';

/// an extension that returns a [VoidResultNullary] from a [Nullary]
extension ResultNullaryCallbackX<T> on Nullary<T> {
  VoidResultNullary get runVoid => nullaryRunVoid<T>(this);
}

/// an extension that returns a [VoidResultNullaryAsync] from a [NullaryAsync]
extension ResultNullaryAsyncCallbackX<T> on NullaryAsync<T> {
  VoidResultNullaryAsync get runVoidAsync => nullaryRunVoidAsync<T>(this);
}

/// an extension that returns a [VoidResultUnary] from a [Unary]
extension ResultUnaryCallbackX<T, S> on Unary<T, S> {
  VoidResultUnary<S> get runVoid => unaryRunVoid<T, S>(this);
}

/// an extension that returns a [VoidResultUnaryAsync] from a [UnaryAsync]
extension ResultUnaryAsyncCallbackX<T, S> on UnaryAsync<T, S> {
  VoidResultUnaryAsync<S> get runVoidAsync => unaryRunVoidAsync<T, S>(this);
}
